import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  final String title;
  final TextEditingController fieldController;

  MyDropdown({
    required this.title,
    required this.fieldController,
  });

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  get title => null;
  set fieldController(TextEditingController fieldController) {}
      

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 4),
            child: Text(
              '${title}',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
          Container(
            height: 48,
            child: DropdownButtonFormField(
              items: [
                'Bersama Orang Tua',
                'Wali',
                'Kost',
                'Asrama',
                'Panti Asuhan',
                'Pesantren',
                'Tempat Pengabdian',
                'Lainya'
              ].map((items) {
                return DropdownMenuItem(
                  value: items.toString(),
                  child: Text(
                    items.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                );
              }).toList(),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Tidak boleh dikosongkan';
                }
              },
              onChanged: (value) {
                setState(() {
                  fieldController = value as TextEditingController;
                });
              },
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
