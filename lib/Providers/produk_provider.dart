import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Models/products.dart';

class ProdukProvider extends ChangeNotifier {
  final List<Products> _produk = [];
  final _db = FirebaseFirestore.instance;

  List<Products> get produks => _produk;

  void addProduk(Products produk) {
    _produk.add(produk);
    notifyListeners();
  }

  void editProduk(Products produk) {
    final index = _produk.indexWhere((element) => element.nama == produk.nama);
    _produk[index] = produk;
    notifyListeners();
  }

  void removeProduk(Products produk) {
    _produk.remove(produk);
    notifyListeners();
  }

  void clearProduk() {
    _produk.clear();
    notifyListeners();
  }

  Future<void> addToCart(
      {required String id,
      required int jumlah,
      required String user,
      required String penjual}) async {
    final Map<String, dynamic> cart = <String, dynamic>{};
    cart['idProduk'] = id;
    cart['jumlah'] = jumlah;
    cart['user'] = user;
    cart['penjual'] = penjual;
    cart['status'] = 'Cart';
    await _db.collection("Charts").add(cart);
  }

  Future<void> addProductList({
    required Products produk,
  }) async {
    final Map<String, dynamic> item = <String, dynamic>{};
    item['id'] = _db.collection("Users").doc().id;
    item['toko'] = produk.toko;
    item['nama'] = produk.nama;
    item['jenis'] = produk.jenis;
    item['harga'] = produk.harga;
    item['keterangan'] = produk.keterangan;
    item['gambar'] = produk.gambar;
    await _db.collection("Products").add(item);
  }
}
