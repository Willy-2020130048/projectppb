import 'package:cloud_firestore/cloud_firestore.dart';

class Carts {
  String idProduk;
  String user;
  int jumlah;
  String status;

  Carts({
    required this.idProduk,
    required this.user,
    required this.jumlah,
    required this.status,
  });

  Carts.fromJson(Map<String, dynamic> json)
      : idProduk = json['idProduk'],
        user = json['user'],
        jumlah = json['jumlah'],
        status = json['status'];

  Map<String, dynamic> toJson() {
    return {
      'idProduk': idProduk,
      'user': user,
      'jumlah': jumlah,
      'status': status,
    };
  }

  factory Carts.fromDoc(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Carts(
      idProduk: data['idProduk'],
      user: data['user'],
      jumlah: data['jumlah'],
      status: data['status'],
    );
  }
}
