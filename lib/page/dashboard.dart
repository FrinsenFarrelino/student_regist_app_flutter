import 'package:flutter/material.dart';
import 'package:student_regist_app/colors/pallet.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.darkBlue,
        title: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Selamat datang, John!', style: TextStyle(fontSize: 16),),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Icon(Icons.account_circle, size: 40,),
              )
            ],
          ),
        ),
      ),
    );
  }
}