import 'package:flutter/material.dart';
import 'package:student_regist_app/components/textfield.dart';
import 'package:intl/intl.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String? _jenisKelamin;
  String? _jenisTinggal;
  String? _agama;
  String? _berkebutuhanKhusus;
  final _namaLengkapController = TextEditingController();
  final _namaPanggilanController = TextEditingController();
  final _nisnController = TextEditingController();
  final _nikController = TextEditingController();
  final _noKKController = TextEditingController();
  final _tempatLahirController = TextEditingController();
  final _dateController = TextEditingController();
  final _cobaController = TextEditingController();
  final _kewarganegaraanController = TextEditingController();
  final _alamatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Registrasi',
          style: TextStyle(fontSize: 15),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        ),
                        color: Colors.grey.shade300,
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      child: Text('Data Pribadi Calon Peserta Didik'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade200,
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          MyTextFormField(
                            title: 'Nama Lengkap Peserta Didik',
                            fieldController: _namaLengkapController,
                          ),
                          MyTextFormField(
                            title: 'Nama Panggilan',
                            fieldController: _namaLengkapController,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    'Jenis Kelamin',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 48,
                                  child: DropdownButtonFormField(
                                    items: [
                                      'Laki-laki',
                                      'Perempuan',
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
                                        _jenisKelamin = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Jenis Kelamin...',
                                      hintStyle: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          MyTextFormField(
                            title: 'NISN',
                            fieldController: _nisnController,
                          ),
                          MyTextFormField(
                            title: 'NIK',
                            fieldController: _nikController,
                          ),
                          MyTextFormField(
                            title: 'No. KK',
                            fieldController: _noKKController,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    'Tempat Lahir',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  child: TextFormField(
                                    controller: _tempatLahirController,
                                    style: TextStyle(fontSize: 12),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.add_location_outlined,
                                        size: 20,
                                      ),
                                      border: OutlineInputBorder(),
                                      hintText: 'Tempat Lahir...',
                                      hintStyle: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    'Tanggal Lahir',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 12),
                                    onTap: () async {
                                      DateTime? dateSelected =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime(2050),
                                      );
                                      if (dateSelected != null) {
                                        var dateForm = DateFormat('d-MM-yyy');
                                        _dateController.text =
                                            dateForm.format(dateSelected);
                                      }
                                    },
                                    controller: _dateController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Tanggal Lahir...',
                                        hintStyle: TextStyle(fontSize: 12),
                                        prefixIcon: Icon(
                                          Icons.date_range_outlined,
                                          size: 20,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    'Agama',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 48,
                                  child: DropdownButtonFormField(
                                    items: [
                                      'Islam',
                                      'Kristen',
                                      'Katholik',
                                      'Hindu',
                                      'Budha',
                                      'Lain-lain'
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
                                        _agama = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Agama...',
                                      hintStyle: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyTextFormField(
                              title: 'Kewarganegaraan',
                              fieldController: _kewarganegaraanController),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    'Berkebutuhan Khusus',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 48,
                                  child: DropdownButtonFormField(
                                    items: [
                                      'Tidak',
                                      'Netra',
                                      'Rungu (B)',
                                      'Grahita Ringan (C)',
                                      'Grahita Sedang (C1)',
                                      'Daksa Ringan (D)',
                                      'Daksa Sedang (D1)',
                                      'Laras (E)',
                                      'Wicara',
                                      'Tuna Ganda (G)',
                                      'Hiper Aktif (H)',
                                      'Cerdas Istimewa (I)',
                                      'Bakat Istimewa (J)',
                                      'Kesulitan Belajar (K)',
                                      'Narkoba (N)',
                                      'Indigo (O)',
                                      'Down Syndrome (P)',
                                      'Autis (Q)'
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
                                        _berkebutuhanKhusus = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Berkebutuhan Khusus?...',
                                      hintStyle: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    'Jenis Tinggal',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
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
                                        _jenisTinggal = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Jenis Tinggal...',
                                      hintStyle: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyTextFormField(title: 'Alamat Tinggal', fieldController: _alamatController)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        ),
                        color: Colors.grey.shade300,
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      child: Text('Foto Pribadi'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade200,
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          MyTextFormField(
                              title: 'coba', fieldController: _cobaController)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
