import 'package:firebase_auth/firebase_auth.dart';
import 'package:jumia/Model/user.dart';
import 'package:jumia/Service/database_service.dart';
import '../Classes/auth_abstract.dart';

class AuthService implements FireBaseAuthentication {
  String errorMessage = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create user obj based on user credential
  UserID? _getUserId(User? user) {
    return (user != null) ? UserID(uid: user.uid) : null;
  }

  //stream for listening for user changes
  @override
  Stream<UserID?> getUserChanges() => _auth.authStateChanges().map(_getUserId);

//sign in user with email and password
  @override
  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _getUserId(credential.user);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.code;
    }
  }

  //sign out user
  @override
  Future signOut() async {
    return await _auth.signOut();
  }

//register new user with email and password
  @override
  Future registerWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String gender,
    required int age,
    required String phoneNumber,
    required String country,
    required String state,
    required String address,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await DataBaseService(uid: credential.user!.uid).setUserPreferences(
          firstName: firstName,
          lastName: lastName,
          gender: gender,
          age: age,
          phoneNumber: phoneNumber,
          country: country,
          state: state,
          address: address);
      return _getUserId(credential.user);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.code;
    }
  }
}
