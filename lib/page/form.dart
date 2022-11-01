import 'package:flutter/material.dart';
import 'package:student_regist_app/components/dropDown.dart';
import 'package:student_regist_app/components/sosialMediaTextField.dart';
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
  String? _jurusan;
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
  final _dusunController = TextEditingController();
  final _rtController = TextEditingController();
  final _rwController = TextEditingController();
  final _codePosTinggalController = TextEditingController();
  final _noKksController = TextEditingController();
  final _anakKeController = TextEditingController();
  final _nomorKIPController = TextEditingController();
  final _namaKIPController = TextEditingController();
  final _noRekBankController = TextEditingController();
  final _rekBankAtasNamaController = TextEditingController();
  final _noHP1Controller = TextEditingController();
  final _noHP2Controller = TextEditingController();
  final _emailController = TextEditingController();
  final _facebookController = TextEditingController();
  final _instagramController = TextEditingController();
  final _tweeterController = TextEditingController();

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
                          MyTextFormField(
                              title: 'Alamat Tinggal',
                              fieldController: _alamatController),
                          MyTextFormField(
                              title: 'Dusun',
                              fieldController: _dusunController),
                          MyTextFormField(
                              title: 'RT', fieldController: _rtController),
                          MyTextFormField(
                              title: 'RW', fieldController: _rwController),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    'Provinsi Tinggal',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 48,
                                  child: DropdownButtonFormField(
                                    items: ['Proinsi tinggal'].map((items) {
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
                                      hintText: 'Propinsi Tinggal...',
                                      hintStyle: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 4),
                                        child: Text(
                                          'Kab./Kota Tinggal',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Container(
                                        height: 48,
                                        child: DropdownButtonFormField(
                                          items: [
                                            'Bersama Orang Tua',
                                            'Wali',
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
                                            hintText: 'Kab./Kota Tinggal...',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 4),
                                        child: Text(
                                          'Kecamatan Tingga;',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Container(
                                        height: 48,
                                        child: DropdownButtonFormField(
                                          items: [
                                            'Bersama Orang Tua',
                                            'Wali',
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
                                            hintText: 'Kecamatan Tingga;...',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 4),
                                        child: Text(
                                          'Jenis ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Container(
                                        height: 48,
                                        child: DropdownButtonFormField(
                                          items: [
                                            'Bersama Orang Tua',
                                            'Wali',
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
                                            hintText: 'Kab./Kota Tinggal...',
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
                                    title: 'Kode Pos Tinggal',
                                    fieldController: _codePosTinggalController),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 4),
                                        child: Text(
                                          'Jenis Transportasi',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Container(
                                        height: 48,
                                        child: DropdownButtonFormField(
                                          items: [
                                            'Bersama Orang Tua',
                                            'Wali',
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
                                            hintText:
                                                'Pilih Jenis Transpottasi...',
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
                                    title: 'Nomor KKS',
                                    fieldController: _noKKController),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                'Anak Ke-',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Container(
                                              height: 63,
                                              width: 210,
                                              child: TextFormField(
                                                controller: _anakKeController,
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: 'Anak Ke-...',
                                                    hintStyle: TextStyle(
                                                        fontSize: 12)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 80,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                'Fisip KIP',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 210,
                                              child: DropdownButtonFormField(
                                                items: [
                                                  'Tidak',
                                                  'Iya',
                                                ].map((items) {
                                                  return DropdownMenuItem(
                                                    value: items.toString(),
                                                    child: Text(
                                                      items.toString(),
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  );
                                                }).toList(),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Tidak boleh dikosongkan';
                                                  }
                                                },
                                                onChanged: (value) {},
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: 'Tidak',
                                                  hintStyle:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                MyTextFormField(
                                    title: 'Nomor KIP',
                                    fieldController: _nomorKIPController),
                                MyTextFormField(
                                    title: 'Nama KIP',
                                    fieldController: _namaKIPController),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 4),
                                        child: Text(
                                          'Layak PIP',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Container(
                                        height: 48,
                                        child: DropdownButtonFormField(
                                          items: [
                                            'Bersama Orang Tua',
                                            'Wali',
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
                                            hintText:
                                                'Pilih Alasan Layak PIP...',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 4),
                                        child: Text(
                                          'Bank',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Container(
                                        height: 48,
                                        child: DropdownButtonFormField(
                                          items: [
                                            'Bersama Orang Tua',
                                            'Wali',
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
                                            hintText: '-Pilih Bank-',
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
                                    title: 'No. Rekening Bank',
                                    fieldController: _noRekBankController),
                                MyTextFormField(
                                    title: 'Rek. Bank Atas Nama',
                                    fieldController:
                                        _rekBankAtasNamaController),
                              ],
                            ),
                          ),
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
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    'Foto Pribadi',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                                Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.image_outlined,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {},
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
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
                      child: Text('Kontak & Sosial Media'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade200,
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MySocialMediaField(
                                    title: 'Telp. / HP 1',
                                    controller: _noHP1Controller),
                                MySocialMediaField(
                                    title: 'Telp. / HP 2',
                                    controller: _noHP2Controller),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MySocialMediaField(
                                    title: 'Email',
                                    controller: _emailController),
                                MySocialMediaField(
                                    title: 'Facebook',
                                    controller: _facebookController),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MySocialMediaField(
                                    title: 'Instagram',
                                    controller: _instagramController),
                                MySocialMediaField(
                                    title: 'Tweeter',
                                    controller: _tweeterController),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
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
                      child: Text('Jurusan Yang DIpilih'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey.shade200,
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: ListTileTheme(
                              horizontalTitleGap: 0,
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: 'Pariwisata',
                                          groupValue: _jurusan,
                                          onChanged: (value) {
                                            setState(() {
                                              _jurusan = value.toString();
                                            });
                                          },
                                        ),
                                        Text(
                                          'PARIWISATA',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: 'Perhotelan',
                                          groupValue: _jurusan,
                                          onChanged: (value) {
                                            setState(() {
                                              _jurusan = value.toString();
                                            });
                                          },
                                        ),
                                        Text(
                                          'PERHOTELAN',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: 'Rekayasa Perangkat Lunak',
                                          groupValue: _jurusan,
                                          onChanged: (value) {
                                            setState(() {
                                              _jurusan =
                                                  value.toString();
                                            });
                                          },
                                        ),
                                        Text(
                                          'REKAYASA PERANGKAT LUNAK',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: 'Tataboga / Kuliner',
                                          groupValue: _jurusan,
                                          onChanged: (value) {
                                            setState(() {
                                              _jurusan = value.toString();
                                            });
                                          },
                                        ),
                                        Text(
                                          'TATABOGA / KULINER',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepPurple),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
