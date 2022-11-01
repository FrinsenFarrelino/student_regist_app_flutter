import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController fieldController;

  MyTextFormField({
    required this.title,
    required this.fieldController, 
  });

  @override
  Widget build(BuildContext context) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: Text(
                '$title',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
            Container(
              height: 70,
              child: TextFormField(
                controller: fieldController,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '$title...',
                  hintStyle: TextStyle(fontSize: 12),
                ),
              ),
            )
          ],
        ),
      );
  }
}
