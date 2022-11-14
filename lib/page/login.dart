import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:student_regist_app/colors/pallet.dart';

class MyLogin extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const MyLogin({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  Future<UserCredential> signInGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInGoogle2() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }

  void validation() {
    FormState? form = formKey.currentState;
    if (form!.validate()) {
      signIn();
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                            'Silahkan masuk dengan akun anda',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
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
                        controller: _emailController,
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
                    SizedBox(
                      width: 271,
                      child: TextFormField(
                        obscureText: _isObscure,
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tolong masukkan password!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        cursorColor: MyColor.darkBlue,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: MyColor.darkBlue)),
                          hintText: 'Password',
                          hintStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
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
                          'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                    ),
                    SizedBox(
                      width: 271,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 70,
                            child: Image.asset('assets/Line.png'),
                          ),
                          const Text(
                            'Atau lanjutkan dengan',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            width: 70,
                            child: Image.asset('assets/Line.png'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                    ),
                    Container(
                      width: 60,
                      height: 60,
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
                          width: 25,
                          height: 25,
                        ),
                        onPressed: () {
                          bool kisweb;
                          try {
                            if (Platform.isAndroid) {
                              kisweb = false;
                            } else {
                              kisweb = true;
                            }
                          } catch (e) {
                            kisweb = true;
                          }

                          if (kisweb) {
                            signInGoogle2();
                          } else {
                            signInGoogle();
                          }
                        },
                      ),
                    ),
                    Container(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Tidak punya akun?',
                          style: TextStyle(fontSize: 18),
                        ),
                        Container(
                          width: 3,
                        ),
                        InkWell(
                          onTap: widget.onClickedSignUp,
                          child: const Text(
                            'Buat sekarang!',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 0, 65, 119)),
                          ),
                        )
                      ],
                    ),
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
