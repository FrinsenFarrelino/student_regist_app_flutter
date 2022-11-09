import 'package:flutter/material.dart';

class MySocialMediaField extends StatelessWidget {
  final String? title;
  final TextEditingController controller;

  MySocialMediaField({required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              '$title',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            height: 50,
            width: 200,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '$title',
                hintStyle: TextStyle(fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
