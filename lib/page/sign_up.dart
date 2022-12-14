import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:email_validator/email_validator.dart';
import 'package:student_regist_app/colors/pallet.dart';

class MySignUp extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const MySignUp({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _namaController = TextEditingController();
  bool _isObscure = true;

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordConfirmController.text,
      );
      await FirebaseAuth.instance.currentUser
          ?.updateDisplayName(_namaController.text);
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(
          'https://firebasestorage.googleapis.com/v0/b/student-registration-app-b356d.appspot.com/o/userImage%2Fblank-profile.png?alt=media&token=80a2d878-6fd5-46c2-8b96-6428c510abd5');
      await FirebaseAuth.instance.signOut();
      widget.onClickedSignIn;
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
      signUp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 271,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hello,',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Container(
                            height: 5,
                          ),
                          const Text(
                            'Yuk bikin akun barumu',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                    ),
                    SizedBox(
                      width: 271,
                      child: TextFormField(
                        controller: _namaController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        cursorColor: MyColor.darkBlue,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: MyColor.darkBlue)),
                          hintText: 'Nama',
                          hintStyle: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      height: 17,
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
                          } else if (value.length < 6) {
                            return 'Masukkan password minimal 6 karakter';
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
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordConfirmController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Konfirmasi password anda!';
                          } else if (value != _passwordController.text) {
                            return 'Password konfirmasi tidak sesuai!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        cursorColor: MyColor.darkBlue,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: MyColor.darkBlue)),
                          hintText: 'Konfirmasi Password',
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
                        onPressed: () async {
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
                          'Daftar',
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
                            offset: const Offset(0, 2),
                          ),
                          BoxShadow(
                            color: MyColor.white,
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: const Offset(0, -2),
                          )
                        ],
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/google.png',
                          width: 25,
                          height: 25,
                        ),
                        onPressed: () async {
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
                      height: 50,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sudah punya akun?',
                            style: TextStyle(fontSize: 18),
                          ),
                          Container(
                            width: 3,
                          ),
                          InkWell(
                            onTap: widget.onClickedSignIn,
                            child: const Text(
                              'Masuk',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 0, 65, 119)),
                            ),
                          )
                        ],
                      ),
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
