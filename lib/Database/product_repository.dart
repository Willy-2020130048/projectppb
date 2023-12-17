import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uas_ppb_1/Models/products.dart';

class ProductRepository {
  Stream<List<Products>> getData() => FirebaseFirestore.instance
      .collection("Products")
      .snapshots()
      .map((event) =>
          event.docs.map((e) => Products.fromJson(e.data())).toList());

  Stream<List<Products>> getDataPenjual(String toko) =>
      FirebaseFirestore.instance
          .collection("Products")
          .where("toko", isEqualTo: toko)
          .snapshots()
          .map((event) =>
              event.docs.map((e) => Products.fromJson(e.data())).toList());

  Stream<List<Products>> getFromId(String id) => FirebaseFirestore.instance
      .collection("Products")
      .where("id", isEqualTo: id)
      .snapshots()
      .map((event) =>
          event.docs.map((e) => Products.fromJson(e.data())).toList());
}
