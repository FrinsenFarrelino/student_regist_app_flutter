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
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        Container(
          height: 5,
        ),
        SizedBox(
          height: 70,
          child: TextFormField(
            controller: fieldController,
            style: const TextStyle(
                fontSize: 14, color: Color.fromARGB(255, 51, 51, 51)),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: '$title...',
              hintStyle: const TextStyle(fontSize: 14),
            ),
          ),
        )
      ],
    );
  }
}
