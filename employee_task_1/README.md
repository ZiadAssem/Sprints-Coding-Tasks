# Employee List App

## Overview

This Flutter application fetches and displays a list of employees from an API. The app uses HTTP requests, an employee model, and the `FutureBuilder` widget to handle asynchronous data fetching.

---

## HTTP Request

The `EmployeeApi` class is responsible for making an HTTP GET request to fetch employee data from `https://dummyjson.com/users`. It parses the JSON response and converts it into a list of `EmployeeModel` objects.

```dart
class EmployeeApi {
  static Future<List<EmployeeModel>> getEmployees() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/users'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> employeesData = data['users'];
        return employeesData.map((json) => EmployeeModel.fromJson(json)).toList();
      } else {
        throw Exception('${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching employees: $e');
    }
  }
}
```

---

## Employee Model

The `EmployeeModel` class represents an employee object with attributes such as `id`, `firstName`, `lastName`, `age`, `gender`, and `role`. It also includes a `fromJson` factory constructor to map JSON data into a Dart object.

```dart
class EmployeeModel {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String gender;
  final String role;

  EmployeeModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.role,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      gender: json['gender'],
      role: json['role'],
    );
  }
}
```

---

## FutureBuilder Widget

The `FutureBuilder` widget is used to fetch asynchronous data. It handles different states such as loading, error, and successful data.

```dart
FutureBuilder<List<EmployeeModel>>(
  future: _futureEmployees,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return Center(child: Text('No employees found.'));
    } else {
      final employees = snapshot.data!;
      return ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return ListTile(
            title: Text('${employee.firstName} ${employee.lastName}'),
            subtitle: Text(employee.role),
          );
        },
      );
    }
  },
)
```

---

## Summary

- **HTTP Requests**: Uses `http` package to fetch employee data.
- **Employee Model**: Defines a structured model for handling API response.
- **FutureBuilder**: Manages the UI state while fetching data asynchronously.


