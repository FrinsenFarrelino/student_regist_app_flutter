import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_regist_app/colors/pallet.dart';
import 'package:student_regist_app/components/sosialMediaTextField.dart';
import 'package:student_regist_app/components/textfield.dart';
import 'package:intl/intl.dart';
import 'package:student_regist_app/page/profile.dart';
import 'package:student_regist_app/dataclass.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  PlatformFile? pickedImage;
  UploadTask? uploadTask;
  String urlPhoto =
      'https://firebasestorage.googleapis.com/v0/b/student-registration-app-b356d.appspot.com/o/userImage%2Fblank-profile.png?alt=media&token=80a2d878-6fd5-46c2-8b96-6428c510abd5';
  final user = FirebaseAuth.instance.currentUser!;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _jenisKelamin = 'Laki-laki';
  String _jenisTinggal = 'Bersama Orang Tua';
  String _agama = 'Islam';
  String _berkebutuhanKhusus = 'Tidak';
  String _jurusan = '';
  String _jenisTransportasi = 'Jalan Kaki';
  String _kpsOrKph = 'Tidak';
  String _layakPip = 'Tidak Menerima PIP';
  String _kip = 'Tidak';
  String _fisikKip = 'Tidak';
  final _namaLengkapController = TextEditingController(text: '');
  final _namaPanggilanController = TextEditingController(text: '');
  final _nisnController = TextEditingController(text: '');
  final _nikController = TextEditingController(text: '');
  final _noKKController = TextEditingController(text: '');
  final _tempatLahirController = TextEditingController(text: '');
  final _dateController = TextEditingController(text: '');
  final _kewarganegaraanController = TextEditingController(text: '');
  final _alamatController = TextEditingController(text: '');
  final _dusunController = TextEditingController(text: '');
  final _rtController = TextEditingController(text: '');
  final _rwController = TextEditingController(text: '');
  final _provinsiController = TextEditingController(text: '');
  final _kabController = TextEditingController(text: '');
  final _kecamatanController = TextEditingController(text: '');
  final _kelurahanController = TextEditingController(text: '');
  final _kodePosTinggalController = TextEditingController(text: '');
  final _noKksController = TextEditingController(text: '');
  final _noKpsKphController = TextEditingController(text: '');
  final _anakKeController = TextEditingController(text: '');
  final _nomorKIPController = TextEditingController(text: '');
  final _namaKIPController = TextEditingController(text: '');
  final _bankController = TextEditingController(text: '');
  final _noRekBankController = TextEditingController(text: '');
  final _rekBankAtasNamaController = TextEditingController(text: '');
  final _noHP1Controller = TextEditingController(text: '');
  final _noHP2Controller = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _facebookController = TextEditingController(text: '');
  final _instagramController = TextEditingController(text: '');
  final _twitterController = TextEditingController(text: '');
  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    db.collection('Form').doc(user.email).get().then(
      (DocumentSnapshot doc) {
        if (doc.exists) {
          final data = doc.data() as Map<String, dynamic>;
          setState(() {
            _namaLengkapController.text = data['namaLengkap'];
            _namaPanggilanController.text = data['namaPanggilan'];
            _jenisKelamin = data['jenisKelamin'];
            _nisnController.text = data['nisn'];
            _nikController.text = data['nik'];
            _noKKController.text = data['noKk'];
            _tempatLahirController.text = data['tempatLahir'];
            _dateController.text = data['tglLahir'];
            _agama = data['agama'];
            _kewarganegaraanController.text = data['kewarganegaraan'];
            _berkebutuhanKhusus = data['kebutuhanKhusus'];
            _jenisTinggal = data['jenisTinggal'];
            _alamatController.text = data['alamatTinggal'];
            _dusunController.text = data['dusun'];
            _rtController.text = data['rt'];
            _rwController.text = data['rw'];
            _provinsiController.text = data['provinsiTinggal'];
            _kabController.text = data['kabKotaTinggal'];
            _kecamatanController.text = data['kecamatanTinggal'];
            _kelurahanController.text = data['kelurahanTinggal'];
            _kodePosTinggalController.text = data['kodePosTinggal'];
            _jenisTransportasi = data['jenisTransportasi'];
            _noKksController.text = data['noKks'];
            _anakKeController.text = data['anakKe'];
            _kpsOrKph = data['kpsKph'];
            _noKpsKphController.text = data['noKpsKph'];
            _kip = data['kip'];
            _fisikKip = data['fisikKip'];
            _nomorKIPController.text = data['noKip'];
            _namaKIPController.text = data['namaKip'];
            _layakPip = data['layakPip'];
            _bankController.text = data['bank'];
            _noRekBankController.text = data['noRek'];
            _rekBankAtasNamaController.text = data['atasNamaBank'];
            _noHP1Controller.text = data['telpHp1'];
            _noHP2Controller.text = data['telpHp2'];
            _emailController.text = data['kontakEmail'];
            _facebookController.text = data['kontakFacebook'];
            _instagramController.text = data['kontakInstagram'];
            _twitterController.text = data['kontakTwitter'];
            _jurusan = data['jurusan'];
            urlPhoto = data['fotoUrl'];
          });
        } else {
          print('Document doesnt exist');
        }
      },
    );
  }

  Future selectPhoto() async {
    final foto = await FilePicker.platform.pickFiles();
    if (foto == null) return;

    setState(() {
      pickedImage = foto.files.first;
    });
  }

  void storeData() async {
    if (pickedImage != null) {
      final path = 'photoForm/${user.email}';
      final file = File(pickedImage!.path!);
      final ref = FirebaseStorage.instance.ref().child(path);
      setState(() {
        uploadTask = ref.putFile(file);
      });

      final snapshot = await uploadTask!.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();

      setState(() {
        urlPhoto = urlDownload;
        uploadTask = null;
        pickedImage = null;
      });
    }

    FormUser form = FormUser(
      email: user.email!,
      namaLengkap: _namaLengkapController.text,
      namaPanggilan: _namaPanggilanController.text,
      jenisKelamin: _jenisKelamin,
      nisn: _nisnController.text,
      nik: _nikController.text,
      noKk: _noKKController.text,
      tempatLahir: _tempatLahirController.text,
      tglLahir: _dateController.text,
      agama: _agama,
      kewarganegaraan: _kewarganegaraanController.text,
      kebutuhanKhusus: _berkebutuhanKhusus,
      jenisTinggal: _jenisTinggal,
      alamatTinggal: _alamatController.text,
      dusun: _dusunController.text,
      rt: _rtController.text,
      rw: _rwController.text,
      provinsiTinggal: _provinsiController.text,
      kabKotaTinggal: _kabController.text,
      kecamatanTinggal: _kecamatanController.text,
      kelurahanTinggal: _kelurahanController.text,
      kodePosTinggal: _kodePosTinggalController.text,
      jenisTransportasi: _jenisTransportasi,
      noKks: _noKksController.text,
      anakKe: _anakKeController.text,
      kpsKph: _kpsOrKph,
      noKpsKph: _noKpsKphController.text,
      kip: _kip,
      fisikKip: _fisikKip,
      noKip: _nomorKIPController.text,
      namaKip: _namaKIPController.text,
      layakPip: _layakPip,
      bank: _bankController.text,
      noRek: _noRekBankController.text,
      atasNamaBank: _rekBankAtasNamaController.text,
      telpHp1: _noHP1Controller.text,
      telpHp2: _noHP2Controller.text,
      kontakEmail: _emailController.text,
      kontakFacebook: _facebookController.text,
      kontakInstagram: _instagramController.text,
      kontakTwitter: _twitterController.text,
      jurusan: _jurusan,
      fotoUrl: urlPhoto,
    );

    await db.collection('Form').doc(user.email!).set(form.toJson());
  }

  void validation() {
    FormState? form = formKey.currentState;
    if (form!.validate()) {
      storeData();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Data berhasil tersimpan!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Gagal menyimpan data!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.darkBlue,
        title: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hello, ${user.displayName!}',
                style: const TextStyle(fontSize: 16),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MyProfile();
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Center(
                    child: Column(
                      children: const [
                        Text(
                          'FORM PENDAFTARAN',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'SISWA BARU SMKTAG',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'TAHUN AJARAN 2022/2023',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: const Border(
                          top: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        ),
                        color: Colors.grey.shade200,
                      ),
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      child: const Text('Data Pribadi Calon Peserta Didik'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          MyTextFormField(
                            title: 'Nama Lengkap Peserta Didik',
                            fieldController: _namaLengkapController,
                          ),
                          MyTextFormField(
                            title: 'Nama Panggilan',
                            fieldController: _namaPanggilanController,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  'Jenis Kelamin',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 55,
                                child: DropdownButtonFormField(
                                  value: _jenisKelamin,
                                  items: [
                                    'Laki-laki',
                                    'Perempuan',
                                  ].map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: const TextStyle(fontSize: 14),
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
                                      _jenisKelamin = value!;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Jenis Kelamin...',
                                    hintStyle: TextStyle(fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tempat Lahir',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Container(
                                height: 5,
                              ),
                              SizedBox(
                                height: 75,
                                child: TextFormField(
                                  controller: _tempatLahirController,
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.add_location_outlined,
                                      size: 20,
                                    ),
                                    border: OutlineInputBorder(),
                                    hintText: 'Tempat Lahir...',
                                    hintStyle: TextStyle(fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tanggal Lahir',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                height: 5,
                              ),
                              SizedBox(
                                height: 75,
                                child: TextFormField(
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
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
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Tanggal Lahir...',
                                      hintStyle: TextStyle(fontSize: 14),
                                      prefixIcon: Icon(
                                        Icons.date_range_outlined,
                                        size: 20,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Agama',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Container(
                                height: 5,
                              ),
                              SizedBox(
                                height: 55,
                                child: DropdownButtonFormField(
                                  value: _agama,
                                  items: [
                                    'Islam',
                                    'Kristen',
                                    'Katholik',
                                    'Hindu',
                                    'Budha',
                                    'Lain-lain'
                                  ].map((items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: const TextStyle(fontSize: 14),
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
                                      _agama = value!;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Agama...',
                                    hintStyle: TextStyle(fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 20,
                          ),
                          MyTextFormField(
                              title: 'Kewarganegaraan',
                              fieldController: _kewarganegaraanController),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  'Berkebutuhan Khusus',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 55,
                                child: DropdownButtonFormField(
                                  value: _berkebutuhanKhusus,
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
                                        style: const TextStyle(fontSize: 14),
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
                                      _berkebutuhanKhusus = value!;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Berkebutuhan khusus...',
                                    hintStyle: TextStyle(fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: const Text(
                                  'Jenis Tinggal',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 55,
                                child: DropdownButtonFormField(
                                  value: _jenisTinggal,
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
                                        style: const TextStyle(fontSize: 14),
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
                                      _jenisTinggal = value!;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: _jenisTinggal,
                                    hintStyle: const TextStyle(fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 20,
                          ),
                          MyTextFormField(
                            title: 'Alamat Tinggal',
                            fieldController: _alamatController,
                          ),
                          MyTextFormField(
                            title: 'Dusun',
                            fieldController: _dusunController,
                          ),
                          MyTextFormField(
                            title: 'RT',
                            fieldController: _rtController,
                          ),
                          MyTextFormField(
                            title: 'RW',
                            fieldController: _rwController,
                          ),
                          MyTextFormField(
                            title: 'Provinsi Tinggal',
                            fieldController: _provinsiController,
                          ),
                          MyTextFormField(
                            title: 'Kab/Kota Tinggal',
                            fieldController: _kabController,
                          ),
                          MyTextFormField(
                            title: 'Kecamatan Tinggal',
                            fieldController: _kecamatanController,
                          ),
                          MyTextFormField(
                            title: 'Kelurahan Tinggal',
                            fieldController: _kelurahanController,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextFormField(
                                title: 'Kode Pos Tinggal',
                                fieldController: _kodePosTinggalController,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: const Text(
                                      'Jenis Transportasi',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 55,
                                    child: DropdownButtonFormField(
                                      value: _jenisTransportasi,
                                      items: [
                                        'Jalan Kaki',
                                        'Kendaraan Pribadi',
                                        'Kendaraan Umum',
                                        'Jemputan Sekolah',
                                        'Kereta Api',
                                        'Ojek',
                                        'Andong / Delman',
                                        'Perahu / Getek',
                                        'Lainnya'
                                      ].map((items) {
                                        return DropdownMenuItem(
                                          value: items.toString(),
                                          child: Text(
                                            items.toString(),
                                            style:
                                                const TextStyle(fontSize: 14),
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
                                          _jenisTransportasi = value!;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Pilih Jenis Transportasi...',
                                        hintStyle: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 20,
                              ),
                              MyTextFormField(
                                  title: 'Nomor KKS',
                                  fieldController: _noKksController),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Anak Ke-',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          height: 55,
                                          width: 150,
                                          child: TextFormField(
                                            controller: _anakKeController,
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Anak Ke-...',
                                                hintStyle:
                                                    TextStyle(fontSize: 14)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'KPS / KPH',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          height: 55,
                                          width: 150,
                                          child: DropdownButtonFormField(
                                            value: _kpsOrKph,
                                            items: [
                                              'Tidak',
                                              'Iya',
                                            ].map((items) {
                                              return DropdownMenuItem(
                                                value: items.toString(),
                                                child: Text(
                                                  items.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
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
                                                _kpsOrKph = value!;
                                              });
                                            },
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Tidak',
                                              hintStyle: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 20,
                              ),
                              MyTextFormField(
                                  title: 'Nomor KPS / KPH',
                                  fieldController: _noKpsKphController),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'KIP',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          height: 55,
                                          width: 150,
                                          child: DropdownButtonFormField(
                                            value: _kip,
                                            items: [
                                              'Tidak',
                                              'Iya',
                                            ].map((items) {
                                              return DropdownMenuItem(
                                                value: items.toString(),
                                                child: Text(
                                                  items.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 14),
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
                                                _kip = value!;
                                              });
                                            },
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Tidak',
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Fisik KIP',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          height: 55,
                                          width: 150,
                                          child: DropdownButtonFormField(
                                            value: _fisikKip,
                                            items: [
                                              'Tidak',
                                              'Iya',
                                            ].map((items) {
                                              return DropdownMenuItem(
                                                value: items.toString(),
                                                child: Text(
                                                  items.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 14),
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
                                                _fisikKip = value!;
                                              });
                                            },
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: 'Tidak',
                                              hintStyle:
                                                  TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 20,
                              ),
                              MyTextFormField(
                                  title: 'Nomor KIP',
                                  fieldController: _nomorKIPController),
                              MyTextFormField(
                                  title: 'Nama KIP',
                                  fieldController: _namaKIPController),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: const Text(
                                      'Layak PIP',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 55,
                                    child: DropdownButtonFormField(
                                      value: _layakPip,
                                      items: [
                                        'Tidak Menerima PIP',
                                        'Pemegang PKH / KIP /KPS',
                                        'Pemegang BSM 2014',
                                        'Yatim Piatu / Panti Asuhan / Panti Sosial',
                                        'Dampak Bencana Alam',
                                        'Pernah DROP OUT',
                                        'Siswa Miskin / Rentan Miskin',
                                        'Daerah Konflik',
                                        'Keluarga Terpidana',
                                        'Kelainan Fisik',
                                      ].map((items) {
                                        return DropdownMenuItem(
                                          value: items.toString(),
                                          child: Text(
                                            items.toString(),
                                            style:
                                                const TextStyle(fontSize: 14),
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
                                          _layakPip = value!;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Pilih Alasan Layak PIP...',
                                        hintStyle: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 20,
                              ),
                              MyTextFormField(
                                  title: 'Bank',
                                  fieldController: _bankController),
                              MyTextFormField(
                                  title: 'No. Rekening Bank',
                                  fieldController: _noRekBankController),
                              MyTextFormField(
                                  title: 'Rek. Bank Atas Nama',
                                  fieldController: _rekBankAtasNamaController),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 15,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: const Border(
                          top: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        ),
                        color: Colors.grey.shade200,
                      ),
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      child: const Text('Foto Pribadi'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 400,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: pickedImage != null
                                    ? Image.file(
                                        File(pickedImage!.path!),
                                        fit: BoxFit.cover,
                                      )
                                    : urlPhoto != null
                                        ? Image.network(
                                            urlPhoto,
                                            fit: BoxFit.cover,
                                          )
                                        : Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.image_outlined,
                                                color: Colors.grey,
                                              ),
                                              onPressed: selectPhoto,
                                            ),
                                          ),
                              ),
                              Container(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: selectPhoto,
                                    child: const Text(
                                      'Pilih Foto',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 0, 65, 119),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 15,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: const Border(
                          top: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        ),
                        color: Colors.grey.shade200,
                      ),
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      child: const Text('Kontak & Sosial Media'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          MySocialMediaField(
                            title: 'Telp. / HP 1',
                            controller: _noHP1Controller,
                          ),
                          MySocialMediaField(
                            title: 'Telp. / HP 2',
                            controller: _noHP2Controller,
                          ),
                          MySocialMediaField(
                            title: 'Email',
                            controller: _emailController,
                          ),
                          MySocialMediaField(
                            title: 'Facebook',
                            controller: _facebookController,
                          ),
                          MySocialMediaField(
                            title: 'Instagram',
                            controller: _instagramController,
                          ),
                          MySocialMediaField(
                            title: 'Twitter',
                            controller: _twitterController,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 15,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: const Border(
                          top: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        ),
                        color: Colors.grey.shade200,
                      ),
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      child: const Text('Jurusan Yang Dipilih'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: ListTileTheme(
                              horizontalTitleGap: 0,
                              child: Column(
                                children: [
                                  Row(
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
                                      const Text(
                                        'PARIWISATA',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Row(
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
                                      const Text(
                                        'PERHOTELAN',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 'Rekayasa Perangkat Lunak',
                                        groupValue: _jurusan,
                                        onChanged: (value) {
                                          setState(() {
                                            _jurusan = value.toString();
                                          });
                                        },
                                      ),
                                      const Text(
                                        'REKAYASA PERANGKAT LUNAK',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Row(
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
                                      const Text(
                                        'TATABOGA / KULINER',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
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
                Container(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () {
                            validation();
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(MyColor.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(MyColor.green),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.save_outlined,
                                size: 17,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Simpan',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
