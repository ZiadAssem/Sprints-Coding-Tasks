class EmployeeModel {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String gender;
  final String role;

  EmployeeModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.gender,
      required this.role});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        age: json['age'],
        gender: json['gender'],
        role: json['role']);
  }
}
