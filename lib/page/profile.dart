import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_regist_app/colors/pallet.dart';
import 'package:student_regist_app/page/splash_screen.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  File? file;
  var pickedImage;
  final user = FirebaseAuth.instance.currentUser!;
  String displayImage = FirebaseAuth.instance.currentUser!.photoURL!;

  void initState() {
    super.initState();

    loadData();
  }

  void pickUpLoadImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = image;
    });

    Reference ref =
        FirebaseStorage.instance.ref().child('userImage/${user.email}');
    await ref.putFile(File(image!.path));
    await ref.getDownloadURL().then((value) {
      user.updatePhotoURL(value);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Berhasil mengubah foto profil! Tarik ke bawah untuk refresh halaman',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  Future loadData() async {
    await Future.delayed(const Duration(milliseconds: 400));

    setState(() {
      displayImage = user.photoURL!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: loadData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 146,
                    height: 146,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 146,
                          height: 146,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(100), // Image border
                              child: SizedBox.fromSize(
                                size:
                                    const Size.fromRadius(100), // Image radius
                                child: pickedImage != null
                                    ? Image.file(
                                        File(pickedImage.path),
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        '$displayImage?t=${DateTime.now().millisecond}',
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: MyColor.darkBlue),
                          child: IconButton(
                            onPressed: () {
                              pickUpLoadImage();
                            },
                            icon: Icon(
                              Icons.photo_camera,
                              color: MyColor.white,
                            ),
                            iconSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: MyColor.darkBlue,
                              )),
                          Container(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama',
                                style: TextStyle(
                                    fontSize: 13, color: MyColor.shadow),
                              ),
                              Container(
                                height: 5,
                              ),
                              Text(
                                user.displayName!,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.mail,
                              size: 30,
                              color: MyColor.darkBlue,
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 13, color: MyColor.shadow),
                              ),
                              Container(
                                height: 5,
                              ),
                              Text(
                                user.email!,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 271,
                  child: ElevatedButton(
                    onPressed: () async {
                      GoogleSignIn googleSignIn = GoogleSignIn();
                      googleSignIn.disconnect();
                      await FirebaseAuth.instance.signOut();
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SplashScreen(),
                        ),
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(MyColor.merah),
                        foregroundColor:
                            MaterialStatePropertyAll(MyColor.white),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.logout_rounded,
                          size: 17,
                        ),
                        Container(
                          width: 3,
                        ),
                        const Text(
                          'Log out',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: MyColor.darkBlue,
        title: const Text(
          'Akun saya',
          style: TextStyle(fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            user.reload();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 19,
        ),
      ),
    );
  }
}
