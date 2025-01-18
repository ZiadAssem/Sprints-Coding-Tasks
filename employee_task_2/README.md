# Employee Management App

## Overview
A Flutter app that fetches employee data using Dio, caches it locally with SharedPreferences, and displays detailed employee information.

## How It Works
- Employees are fetched using Dio from `https://dummyjson.com/users`:
  ```dart
  final dio = Dio();
  final response = await dio.get('https://dummyjson.com/users');
  if (response.statusCode == 200) {
    final List<dynamic> employeesData = response.data['users'];
    return employeesData.map((json) => EmployeeModel.fromJson(json)).toList();
  }
  ```
- Data is cached locally using SharedPreferences:
  ```dart
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('cachedEmployees', jsonEncode(employeesData));
  ```
- If the API call fails, cached data is displayed:
  ```dart
  final String? cachedData = prefs.getString('cachedEmployees');
  if (cachedData != null) {
    final List<dynamic> employeesData = jsonDecode(cachedData);
    return employeesData.map((json) => EmployeeModel.fromJson(json)).toList();
  }
  ```
- Clicking an employee navigates to their details page.

