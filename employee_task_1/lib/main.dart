import 'package:employee_task_1/model/employee_model.dart';
import 'package:employee_task_1/source/employee_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        useMaterial3: true,
      ),
      home: EmployeeListWidget(),
    );
  }
}

class EmployeeListWidget extends StatefulWidget {
  @override
  _EmployeeListWidgetState createState() => _EmployeeListWidgetState();
}

class _EmployeeListWidgetState extends State<EmployeeListWidget> {
  Future<List<EmployeeModel>>? _futureEmployees;

  void _loadEmployees() {
    setState(() {
      _futureEmployees = EmployeeApi.getEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _loadEmployees,
            child: Text('Load Employees'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: _futureEmployees == null
                ? Center(child: Text('Press the button to load employees'))
                : FutureBuilder<List<EmployeeModel>>(
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
                              child: ListTile(
                                leading: Text(employee.id.toString()),
                                title: Text(
                                    '${employee.firstName} ${employee.lastName}'),
                                subtitle: Text(employee.role),
                                trailing: Text(employee.gender),
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
