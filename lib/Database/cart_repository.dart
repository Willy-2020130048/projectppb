import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/carts.dart';

class CartRepository {
  Stream<List<Carts>> getDataCart(String? email) => FirebaseFirestore.instance
      .collection("Charts")
      .where("user", isEqualTo: email)
      .where("status", isEqualTo: "Cart")
      .snapshots()
      .map((event) => event.docs.map((e) => Carts.fromJson(e.data())).toList());

  Stream<List<Carts>> getDataTransaksi(String? email) => FirebaseFirestore
      .instance
      .collection("Charts")
      .where("user", isEqualTo: email)
      .where("status", isNotEqualTo: "Cart")
      .snapshots()
      .map((event) => event.docs.map((e) => Carts.fromJson(e.data())).toList());

  Stream<List<Carts>> getDataTransaksiPenjual(String? penjual) =>
      FirebaseFirestore.instance
          .collection("Charts")
          .where("penjual", isEqualTo: penjual)
          .where("status", isEqualTo: "Sedang Diproses")
          .snapshots()
          .map((event) =>
              event.docs.map((e) => Carts.fromJson(e.data())).toList());

  Future<String> getDoc(String? email, String id) async {
    String idDocs = "";
    await FirebaseFirestore.instance
        .collection("Charts")
        .where("user", isEqualTo: email)
        .get()
        .then((snapshot) => {idDocs = snapshot.docs[0].id});
    return idDocs;
  }

  Future<void> checkoutCart(String? email) async {
    FirebaseFirestore.instance
        .collection("Charts")
        .where("user", isEqualTo: email)
        .get()
        .then(
          (value) => {
            value.docs.forEach(
              (element) {
                FirebaseFirestore.instance
                    .collection("Charts")
                    .doc(element.id)
                    .update({"status": "Sedang Diproses"});
              },
            ),
          },
        );
  }
}
