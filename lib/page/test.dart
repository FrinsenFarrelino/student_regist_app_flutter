import 'package:flutter/material.dart';

class MyTest extends StatelessWidget {
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text('Anak ke-', style: TextStyle(fontSize: 12),),
                        ),
                        Container(
                          height: 70,
                          width: 200,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder()
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Fisip KIP',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          child: DropdownButtonFormField(
                            items: [
                              'Tidak',
                              'Iya',
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
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Tidak',
                              hintStyle: TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}