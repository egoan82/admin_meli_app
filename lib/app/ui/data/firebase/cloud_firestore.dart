import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore {
  static final CloudFirestore _instance = CloudFirestore._internal();

  CloudFirestore._internal();
  static CloudFirestore get i => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveTokenPhone(String token) async {
    // ignore: todo
    //TODO CONSULTAR SI EXISTE UN ID GUARDADO EN LA SESSION
    _firestore.collection('admin-tienda-phones').add({
      'token': token,
      'date': DateTime.now(),
    }).then(
      (value) {
        // ignore: todo
        //TODO GUARDAR EL ID EN LA SESSION
        // print("User Added ${value.id}");
      },
    ).catchError(
      (error) {
        // print("Failed to add user: $error");
      },
    );
  }

  Future<void> updateTokenPhone(String token) async {
    _firestore
        .collection('admin-tienda-phones')
        .doc('4rzimFMn3gSBzyCuzdxJ')
        .update({
      'token': token,
      'date': DateTime.now(),
    });
  }
}
