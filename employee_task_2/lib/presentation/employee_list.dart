import 'package:employee_task_2/model/employee_model.dart';
import 'package:employee_task_2/presentation/employee_details.dart';
import 'package:employee_task_2/source/employee_api.dart';
import 'package:flutter/material.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  EmployeeListWidgetState createState() => EmployeeListWidgetState();
}

class EmployeeListWidgetState extends State<EmployeeList> {
  Future<List<EmployeeModel>>? _futureEmployees;

  @override
  void initState() {
    super.initState();
    _loadCachedEmployees();
  }

  void _loadEmployees() async {
    setState(() {
      _futureEmployees = EmployeeApi.getEmployees();
    });

    try {
      await _futureEmployees;
    } catch (e) {
      _showSnackBar('Failed to load employees. Showing cached data.');
      _loadCachedEmployees(); 
    }
  }

  void _loadCachedEmployees() {
    setState(() {
      _futureEmployees = EmployeeApi.getCachedEmployees();
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _loadEmployees,
            child: Text('Load Employees'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: FutureBuilder<List<EmployeeModel>>(
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
                      return Card(
                        elevation: 10,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EmployeeDetails(employee: employee),
                            ),
                          ),
                          child: ListTile(
                            leading: Text(employee.id.toString()),
                            title: Text('${employee.firstName} ${employee.lastName}'),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
