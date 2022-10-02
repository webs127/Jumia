abstract class FireBaseAuthentication {
  //Sign in user with existing email and password
  Future signInWithEmailAndPassword(
      {required String email, required String password});

  //Create new user with email and password
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
  });

  //Sign out user
  Future signOut();

  //Stream for listening for user changes
  Stream getUserChanges();
}
