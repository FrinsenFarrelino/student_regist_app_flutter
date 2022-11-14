import 'package:flutter/material.dart';
import 'package:student_regist_app/page/login.dart';
import 'package:student_regist_app/page/sign_up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? MyLogin(onClickedSignUp: toggle)
      : MySignUp(onClickedSignIn: toggle);

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
