import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Provides the font family to the application
        fontFamily: 'Suwannaphum',
      ),
      title: 'Task 9',
      home:const Task9(),
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
          // centering the widgets
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                // getting image from assets
                Image(
                    width: 150, image: AssetImage('assets/images/sprints.png')),
                // gap
                SizedBox(width: 20),
                // getting image from network
                Image(
                    width: 150,
                    image: NetworkImage('https://picsum.photos/200/300'))
              ],
            ),
            // gap
            SizedBox(height: 20),
            Text(
              'The two images are displayed"',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Suwannaphum',
                  color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
