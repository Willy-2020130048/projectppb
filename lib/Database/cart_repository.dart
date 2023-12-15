import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/carts.dart';

class CartRepository {
  Stream<List<Carts>> getData(String? email) => FirebaseFirestore.instance
      .collection("Charts")
      .where("user", isEqualTo: email)
      .snapshots()
      .map((event) => event.docs.map((e) => Carts.fromJson(e.data())).toList());

  Future<String> getDoc(String? email, String id) async {
    String idDocs = "";
    await FirebaseFirestore.instance
        .collection("Charts")
        .where("user", isEqualTo: email)
        .get()
        .then((snapshot) => {idDocs = snapshot.docs[0].id});
    return idDocs;
  }
}
