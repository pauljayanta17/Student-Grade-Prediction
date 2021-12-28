import 'package:flutter/material.dart';
import 'package:student_grade_predection/enter_marks.dart';
import 'package:student_grade_predection/welcomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Grade Prediction',
      home: Builder(builder: (context) => const WelcomePage()),
      debugShowCheckedModeBanner: false,
      routes: {
        StudentMarks.routename: (context) => const StudentMarks(),
        WelcomePage.routename: (context) => const WelcomePage()
      },
    );
  }
}
