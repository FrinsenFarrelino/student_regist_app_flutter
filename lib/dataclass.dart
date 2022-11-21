class FormUser {
  final String email;
  final String namaLengkap;
  final String namaPanggilan;
  final String jenisKelamin;
  final String nisn;
  final String nik;
  final String noKk;
  final String tempatLahir;
  final String tglLahir;
  final String agama;
  final String kewarganegaraan;
  final String kebutuhanKhusus;
  final String jenisTinggal;
  final String alamatTinggal;
  final String dusun;
  final String rt;
  final String rw;
  final String provinsiTinggal;
  final String kabKotaTinggal;
  final String kecamatanTinggal;
  final String kelurahanTinggal;
  final String kodePosTinggal;
  final String jenisTransportasi;
  final String noKks;
  final String anakKe;
  final String kpsKph;
  final String noKpsKph;
  final String kip;
  final String fisikKip;
  final String noKip;
  final String namaKip;
  final String layakPip;
  final String bank;
  final String noRek;
  final String atasNamaBank;
  final String telpHp1;
  final String telpHp2;
  final String kontakEmail;
  final String kontakFacebook;
  final String kontakInstagram;
  final String kontakTwitter;
  final String jurusan;
  final String fotoUrl;

  FormUser({
    required this.email,
    required this.namaLengkap,
    required this.namaPanggilan,
    required this.jenisKelamin,
    required this.nisn,
    required this.nik,
    required this.noKk,
    required this.tempatLahir,
    required this.tglLahir,
    required this.agama,
    required this.kewarganegaraan,
    required this.kebutuhanKhusus,
    required this.jenisTinggal,
    required this.alamatTinggal,
    required this.dusun,
    required this.rt,
    required this.rw,
    required this.provinsiTinggal,
    required this.kabKotaTinggal,
    required this.kecamatanTinggal,
    required this.kelurahanTinggal,
    required this.kodePosTinggal,
    required this.jenisTransportasi,
    required this.noKks,
    required this.anakKe,
    required this.kpsKph,
    required this.noKpsKph,
    required this.kip,
    required this.fisikKip,
    required this.noKip,
    required this.namaKip,
    required this.layakPip,
    required this.bank,
    required this.noRek,
    required this.atasNamaBank,
    required this.telpHp1,
    required this.telpHp2,
    required this.kontakEmail,
    required this.kontakFacebook,
    required this.kontakInstagram,
    required this.kontakTwitter,
    required this.jurusan,
    required this.fotoUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "namaLengkap": namaLengkap,
      "namaPanggilan": namaPanggilan,
      "jenisKelamin": jenisKelamin,
      "nisn": nisn,
      "nik": nik,
      "noKk": noKk,
      "tempatLahir": tempatLahir,
      "tglLahir": tglLahir,
      "agama": agama,
      "kewarganegaraan": kewarganegaraan,
      "kebutuhanKhusus": kebutuhanKhusus,
      "jenisTinggal": jenisTinggal,
      "alamatTinggal": alamatTinggal,
      "dusun": dusun,
      "rt": rt,
      "rw": rw,
      "provinsiTinggal": provinsiTinggal,
      "kabKotaTinggal": kabKotaTinggal,
      "kecamatanTinggal": kecamatanTinggal,
      "kelurahanTinggal": kelurahanTinggal,
      "kodePosTinggal": kodePosTinggal,
      "jenisTransportasi": jenisTransportasi,
      "noKks": noKks,
      "anakKe": anakKe,
      "kpsKph": kpsKph,
      "noKpsKph": noKpsKph,
      "kip": kip,
      "fisikKip": fisikKip,
      "noKip": noKip,
      "namaKip": namaKip,
      "layakPip": layakPip,
      "bank": bank,
      "noRek": noRek,
      "atasNamaBank": atasNamaBank,
      "telpHp1": telpHp1,
      "telpHp2": telpHp2,
      "kontakEmail": kontakEmail,
      "kontakFacebook": kontakFacebook,
      "kontakInstagram": kontakInstagram,
      "kontakTwitter": kontakTwitter,
      "jurusan": jurusan,
      "fotoUrl": fotoUrl,
    };
  }

  factory FormUser.fromJson(Map<String, dynamic> json) {
    return FormUser(
      email: json['email'],
      namaLengkap: json['namaLengkap'],
      namaPanggilan: json['namaPanggilan'],
      jenisKelamin: json['jenisKelamin'],
      nisn: json['nisn'],
      nik: json['nik'],
      noKk: json['noKk'],
      tempatLahir: json['tempatLahir'],
      tglLahir: json['tglLahir'],
      agama: json['agama'],
      kewarganegaraan: json['kewarganegaraan'],
      kebutuhanKhusus: json['kebutuhanKhusus'],
      jenisTinggal: json['jenisTinggal'],
      alamatTinggal: json['alamatTinggal'],
      dusun: json['dusun'],
      rt: json['rt'],
      rw: json['rw'],
      provinsiTinggal: json['provinsiTinggal'],
      kabKotaTinggal: json['kabKotaTinggal'],
      kecamatanTinggal: json['kecamatanTinggal'],
      kelurahanTinggal: json['kelurahanTinggal'],
      kodePosTinggal: json['kodePosTinggal'],
      jenisTransportasi: json['jenisTransportasi'],
      noKks: json['noKks'],
      anakKe: json['anakKe'],
      kpsKph: json['kpsKph'],
      noKpsKph: json['noKpsKph'],
      kip: json['kip'],
      fisikKip: json['fisikKip'],
      noKip: json['noKip'],
      namaKip: json['namaKip'],
      layakPip: json['layakPip'],
      bank: json['bank'],
      noRek: json['noRek'],
      atasNamaBank: json['atasNamaBank'],
      telpHp1: json['telpHp1'],
      telpHp2: json['telpHp2'],
      kontakEmail: json['kontakEmail'],
      kontakFacebook: json['kontakFacebook'],
      kontakInstagram: json['kontakInstagram'],
      kontakTwitter: json['kontakTwitter'],
      jurusan: json['jurusan'],
      fotoUrl: json['fotoUrl'],
    );
  }
}
