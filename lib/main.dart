import 'package:flutter/material.dart';
import 'package:zekademy/Screens/dashboard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zekademy Proj',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Dashboard(),
    );
  }
}
