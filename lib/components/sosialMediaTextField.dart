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
            style: const TextStyle(fontSize: 12),
          ),
          Container(
            height: 3,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: '$title',
                hintStyle: const TextStyle(fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
