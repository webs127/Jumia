import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jumia/Model/document.dart';
import '../Classes/database_abstract.dart';

class DataBaseService implements DataRepo {
  final String uid;
  final CollectionReference _user =
      FirebaseFirestore.instance.collection("User");
  DataBaseService({required this.uid});
  @override
  Future setUserPreferences(
      {required String firstName,
      required String lastName,
      required String gender,
      required int age,
      required String phoneNumber,
      required String country,
      required String state,
      required String address}) async {
    return await _user.doc(uid).set({
      'FirstName': firstName,
      'LastName': lastName,
      'Gender': gender,
      'Age': age,
      'PhoneNumber': phoneNumber,
      'Country': country,
      'State': state,
      'Address': address
    });
  }

  @override
  Future updateUserPreferences(
      {required String firstName,
      required String lastName,
      required String nickName,
      required String address}) async {
    return await _user.doc(uid).update({
      'FirstName': firstName,
      'LastName': lastName,
      'NickName': nickName,
      'Address': address
    });
  }

  @override
  Stream<DocumentSnapshot?> documentSnapShots() => _user.doc(uid).snapshots();

  DocumentData? getDocument(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return (snapshot.exists) ? DocumentData.fromJson(data) : null;
  }
}
