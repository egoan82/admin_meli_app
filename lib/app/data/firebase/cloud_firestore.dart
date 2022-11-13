import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../../domain/models/session.dart';
import '../local/authentication_client.dart';

class CloudFirestore {
  static final CloudFirestore _instance = CloudFirestore._internal();
  static AuthenticationClient autenticationClient =
      GetIt.I.get<AuthenticationClient>();

  CloudFirestore._internal();
  static CloudFirestore get i => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveTokenPhone(String token, String idDevice) async {
    Session session = await autenticationClient.getSession;

    _firestore.collection('admin-tienda-phones').add({
      'name': session.user,
      'token': token,
      'idDevice': idDevice,
      'date': DateTime.now(),
    }).then(
      (value) async {
        await autenticationClient.saveInfoDevice(
          idDevice,
          token,
          value.id,
        );
        // print("User Added ${value.id}");
      },
    ).catchError(
      (error) {
        // print("Failed to add user: $error");
      },
    );
  }

  Future<void> getUser(String user, [String? idDevice]) async {
    await _firestore
        .collection("admin-tienda-phones")
        .where("idDevice", isEqualTo: "SKQ1.210908.001")
        .get()
        .then((value) {
      print("😀😀😀");
      print(value.docs.length);
      print(value.docs[0]['name']);
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  Future<void> updateTokenPhone(
    String token,
    String idDevice,
    String idFireBase,
  ) async {
    Session session = await autenticationClient.getSession;

    _firestore.collection('admin-tienda-phones').doc(idFireBase).update({
      'token': token,
      'name': session.user,
      'date': DateTime.now(),
    });
  }
}
