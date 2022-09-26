abstract class FireBaseAuthentication {
  Future signInWithEmailAndPassword({required String email, required String password});
  Future registerWithEmailAndPassword({required String email, required String password, required String firstName,
    required String lastName,
    required String gender,
    required int age,
    required String phoneNumber,
    required String country,
    required String state,
    required String address,});
  Future signOut();
  Stream getUserChanges();
}