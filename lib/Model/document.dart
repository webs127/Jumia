class DocumentData {
  final String firstName;
  final String lastName;
  final int age;
  final String gender;
  final String phoneNumber;
  final String country;
  final String state;
  final String address;

  DocumentData(
      {required this.firstName,
      required this.lastName,
      required this.age,
      required this.gender,
      required this.phoneNumber,
      required this.country,
      required this.state,
      required this.address});
  
  factory DocumentData.fromJson(Map<String, dynamic> doc) => DocumentData(
      firstName: doc["FirstName"] ?? "",
      lastName: doc["LastName"] ?? "",
      age: doc["Age"] ?? 0,
      gender: doc["Gender"] ?? "",
      phoneNumber: doc["PhoneNumber"] ?? "",
      country: doc["Country"]  ?? "",
      state: doc["State"] ?? "",
      address: doc["Address"] ?? "");
}
