abstract class DataRepo {
  Future setUserPreferences({
    required String firstName,
    required String lastName,
    required String gender,
    required int age,
    required String phoneNumber,
    required String country,
    required String state,
    required String address,
  });

  Future updateUserPreferences({
    required String firstName,
    required String lastName,
    required String nickName,
    required String address,
  });

  Stream documentSnapShots();
}