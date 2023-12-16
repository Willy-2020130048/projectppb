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

  Future<void> addToCart({
    required String id,
    required int jumlah,
    required String user,
  }) async {
    final Map<String, dynamic> cart = <String, dynamic>{};
    cart['idProduk'] = id;
    cart['jumlah'] = jumlah;
    cart['user'] = user;
    await _db.collection("Charts").add(cart);
  }
}
