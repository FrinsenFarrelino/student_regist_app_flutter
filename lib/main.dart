import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_regist_app/firebase_options.dart';
import 'package:student_regist_app/page/dashboard.dart';
import 'package:student_regist_app/page/form.dart';
import 'package:student_regist_app/page/login.dart';
import 'package:student_regist_app/page/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLogin(),
    );
  }
}
