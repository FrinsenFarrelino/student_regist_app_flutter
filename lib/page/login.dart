import 'dart:html';

import 'package:flutter/material.dart';
import 'package:student_regist_app/page/form.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple.shade700,
                Colors.deepPurple.shade600,
                Colors.deepPurple.shade300,
                Colors.deepPurple.shade200,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      'PENDAFTARAN',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'PESERTA DIDIK BARU',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 260,
                height: 54,
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email tidak boleh kosong!';
                    }
                  },
                  style: TextStyle(fontSize: 13, color: Colors.white),
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(13)),
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 260,
                height: 54,
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Tolong masukkan password!';
                    }
                  },
                  style: TextStyle(fontSize: 13, color: Colors.white),
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(13)),
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 260,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return MyForm();
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
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
