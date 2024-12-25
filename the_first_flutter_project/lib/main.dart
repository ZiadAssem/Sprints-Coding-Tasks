import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task 9',
      home: Task9(),
    );
  }
}

class Task9 extends StatelessWidget {
  const Task9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Task 9'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image(
                  width: 150,
                  image: AssetImage('assets/images/sprints.png')),
                Image(
                  width: 150,
                  image: AssetImage('assets/images/flutter.png'))
              ],
            ),
            Text(
              'Hello Flutter, task 9',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600 , color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
