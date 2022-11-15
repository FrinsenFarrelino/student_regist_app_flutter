import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_regist_app/colors/pallet.dart';

class LupaPassword extends StatefulWidget {
  const LupaPassword({super.key});

  @override
  State<LupaPassword> createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Link untuk reset password telah dikirim ke email anda!')));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  void validation() {
    FormState? form = formKey.currentState;
    if (form!.validate()) {
      resetPassword();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 271,
                      child: Column(
                        children: const [
                          Text(
                            'Masukkan email anda yang terdaftar',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                    ),
                    SizedBox(
                      width: 271,
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tolong Masukkan email!';
                          } else if (!EmailValidator.validate(value)) {
                            return 'Masukkan email yang valid!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        cursorColor: MyColor.darkBlue,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: MyColor.darkBlue)),
                          hintText: 'Email',
                          hintStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      height: 25,
                    ),
                    Container(
                      height: 30,
                    ),
                    SizedBox(
                      width: 271,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          validation();
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(MyColor.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              MyColor.darkBlue),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Reset Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Kembali ke login',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 65, 119)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
