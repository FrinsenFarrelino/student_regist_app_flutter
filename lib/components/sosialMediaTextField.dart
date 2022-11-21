import 'package:flutter/material.dart';

class MySocialMediaField extends StatelessWidget {
  final String? title;
  final TextEditingController controller;

  const MySocialMediaField({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: const TextStyle(fontSize: 14),
          ),
          Container(
            height: 5,
          ),
          SizedBox(
            height: 60,
            width: 350,
            child: TextFormField(
              controller: controller,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 51, 51, 51),
              ),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: '$title',
                hintStyle: const TextStyle(fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
