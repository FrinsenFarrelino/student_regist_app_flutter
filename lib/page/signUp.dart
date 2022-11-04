import 'dart:html';
import 'package:flutter/material.dart';
import 'package:student_regist_app/colors/pallet.dart';
import 'package:student_regist_app/page/form.dart';

class MySignUp extends StatefulWidget {
  const MySignUp({super.key});

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 271,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Yuk bikin akun barumu',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 271,
                height: 40,
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama tidak boleh kosong!';
                    }
                  },
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  cursorColor: MyColor.darkBlue,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: MyColor.darkBlue)),
                    hintText: 'Nama',
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                width: 271,
                height: 40,
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email tidak boleh kosong!';
                    }
                  },
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  cursorColor: MyColor.darkBlue,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: MyColor.darkBlue)),
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 271,
                height: 30,
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Tolong masukkan password!';
                    }
                  },
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  cursorColor: MyColor.darkBlue,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 15),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: MyColor.darkBlue)),
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 271,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return MyDashboard();
                      }),
                    );
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(MyColor.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(MyColor.darkBlue),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 271,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 70,
                      child: Image.asset('assets/Line.png'),
                    ),
                    Text(
                      'Atau lanjutkan dengan',
                      style: TextStyle(fontSize: 12),
                    ),
                    Container(
                      width: 70,
                      child: Image.asset('assets/Line.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: MyColor.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: MyColor.shadow,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                    BoxShadow(
                      color: MyColor.white,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, -2),
                    )
                  ],
                ),
                child: IconButton(
                  icon: Image.asset(
                    'assets/google.png',
                    width: 17,
                    height: 17,
                  ),
                  onPressed: () {},
                ),
              ),              
              SizedBox(
                height: 100,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Masuk',
                        style: TextStyle(fontSize: 14, color: MyColor.darkBlue),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
