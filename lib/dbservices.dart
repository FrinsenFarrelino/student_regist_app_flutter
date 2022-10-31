import 'package:cloud_firestore/cloud_firestore.dart';

import 'dataclass.dart';

CollectionReference tblUser = FirebaseFirestore.instance.collection('User');

class Database {
  static Stream<QuerySnapshot> getData() {
    return tblUser.snapshots();
  }

  static Future<void> tambahData({required User user}) async {
    DocumentReference docRef = tblUser.doc(user.itemEmail);

    await docRef
        .set(user.toJson())
        .whenComplete(() => print('Data Berhasil diinput'))
        .catchError((e) => print(e));
  }
}
