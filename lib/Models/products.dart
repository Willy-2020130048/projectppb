import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  String id;
  String gambar;
  String toko;
  String nama;
  String jenis;
  int harga;
  String keterangan;

  Products({
    required this.id,
    required this.gambar,
    required this.toko,
    required this.nama,
    required this.harga,
    required this.jenis,
    required this.keterangan,
  });

  Products.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        gambar = json['gambar'],
        toko = json['toko'],
        nama = json['nama'],
        harga = json['harga'],
        jenis = json['jenis'],
        keterangan = json['keterangan'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gambar': gambar,
      'toko': toko,
      'nama': nama,
      'harga': harga,
      'jenis': jenis,
      'keterangan': keterangan
    };
  }

  factory Products.fromDoc(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Products(
      id: data['id'],
      gambar: data['gambar'],
      toko: data['toko'],
      nama: data['nama'],
      harga: data['harga'],
      jenis: data['jenis'],
      keterangan: data['keterangan'],
    );
  }
}
