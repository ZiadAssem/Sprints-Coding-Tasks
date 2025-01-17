import 'dart:convert';

import 'package:employee_task_1/model/employee_model.dart';
import 'package:http/http.dart' as http;

class EmployeeApi {
  static Future<List<EmployeeModel>> getEmployees() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/users'));
      if (response.statusCode == 200) {
        final Map<String,dynamic> data = json.decode(response.body);
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
