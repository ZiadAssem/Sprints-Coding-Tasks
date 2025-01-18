import 'package:employee_task_2/model/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatelessWidget {
  final EmployeeModel employee;
  const EmployeeDetails({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(50)),
              child: Image.network(employee.image),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ID: ${employee.id} ',style: customTextStyle(),),
                Text('Name: ${employee.firstName} ${employee.lastName}',style: customTextStyle(),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Role: ${employee.role} ',style: customTextStyle(),),
                Text('Age: ${employee.age} ',style: customTextStyle(),),
                Text('Gender: ${employee.gender} ',style: customTextStyle(),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle customTextStyle(){
  return TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold
  );
}
