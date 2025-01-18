import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:employee_task_2/model/employee_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeApi {
  static Future<List<EmployeeModel>> getEmployees() async {
    try {
      final dio = Dio();
      final response = await dio.get('https://dummyjson.com/users');
      if (response.statusCode == 200) {
        final List<dynamic> employeesData = response.data['users'];
        final List<EmployeeModel> employees = employeesData.map((json) => EmployeeModel.fromJson(json)).toList();

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('cachedEmployees', jsonEncode(employeesData));

        return employees;
      } else {
        throw Exception('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching employees: $e');
    }
  }

  static Future<List<EmployeeModel>> getCachedEmployees() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cachedData = prefs.getString('cachedEmployees');
    
    if (cachedData != null) {
      final List<dynamic> employeesData = jsonDecode(cachedData);
      return employeesData.map((json) => EmployeeModel.fromJson(json)).toList();
    }
    return [];
  }
}
