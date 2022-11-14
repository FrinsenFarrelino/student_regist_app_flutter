import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_regist_app/colors/pallet.dart';
import 'package:student_regist_app/page/auth_page.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Container(
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
                                  size: Size.fromRadius(100), // Image radius
                                  child: Image.asset('assets/faruq.jpg',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            )),
                        Container(
                          width: 45,
                          height: 45,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: MyColor.darkBlue),
                          child: IconButton(
                            onPressed: () {},
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
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 325,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.person,
                                size: 30,
                                color: MyColor.darkBlue,
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama',
                                  style: TextStyle(
                                      fontSize: 10, color: MyColor.shadow),
                                ),
                                Text(
                                  'John Doe',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.mail,
                                size: 25,
                                color: MyColor.darkBlue,
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                      fontSize: 10, color: MyColor.shadow),
                                ),
                                Text(
                                  'johndoe@gmail.com',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.lock,
                                size: 30,
                                color: MyColor.darkBlue,
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pembayaran PIN pendaftaran',
                                  style: TextStyle(
                                      fontSize: 10, color: MyColor.shadow),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Sudah upload',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: MyColor.green),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.image,
                                        size: 16,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '2423424246.jpg',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.cancel_outlined,
                                            size: 16,
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 117,
                                  height: 27,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Upload bukti',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                MyColor.darkBlue),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                MyColor.white),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)))),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.article_sharp,
                                size: 25,
                                color: MyColor.darkBlue,
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pembayaran daftar ulang',
                                  style: TextStyle(
                                      fontSize: 10, color: MyColor.shadow),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Belum upload',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: MyColor.green),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 117,
                                  height: 27,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Upload bukti',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                MyColor.merah),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                MyColor.white),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)))),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 56,
              ),
              SizedBox(
                height: 40,
                width: 271,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthPage(),
                      ),
                    );
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          size: 17,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Log out',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(MyColor.merah),
                      foregroundColor: MaterialStatePropertyAll(MyColor.white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: MyColor.darkBlue,
        title: Text(
          'Akun saya',
          style: TextStyle(fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 19,
        ),
      ),
    );
  }
}
