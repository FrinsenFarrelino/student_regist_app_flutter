import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController fieldController;

  const MyTextFormField({
    super.key,
    required this.title,
    required this.fieldController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4),
          child: Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 70,
          child: TextFormField(
            controller: fieldController,
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: '$title...',
              hintStyle: const TextStyle(fontSize: 12),
            ),
          ),
        )
      ],
    );
  }
}
