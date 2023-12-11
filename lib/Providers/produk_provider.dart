import 'package:flutter/material.dart';

import '../Models/produks.dart';

class ProdukProvider extends ChangeNotifier {
  final List<Produk> _produk = [];

  List<Produk> get produks => _produk;

  void addProduk(Produk produk) {
    _produk.add(produk);
    notifyListeners();
  }

  void editProduk(Produk produk) {
    final index = _produk.indexWhere((element) => element.nama == produk.nama);
    _produk[index] = produk;
    notifyListeners();
  }

  void removeProduk(Produk produk) {
    _produk.remove(produk);
    notifyListeners();
  }

  void clearProduk() {
    _produk.clear();
    notifyListeners();
  }
}
