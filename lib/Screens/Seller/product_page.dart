import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uas_ppb_1/Database/user_repository.dart';
import 'package:uas_ppb_1/Providers/produk_provider.dart';

import '../../Database/product_repository.dart';
import '../../Models/products.dart';
import '../../Models/teks.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _jenisController = TextEditingController();
  final TextEditingController _gambarController = TextEditingController();
  // Anda bisa menambahkan kontroler untuk gambar jika diperlukan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: StreamBuilder(
          stream: UserRepository()
              .getData(FirebaseAuth.instance.currentUser!.email),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Error"));
            } else if (!snapshot.hasData) {
              return const Center(child: Text("Loading"));
            } else {
              return StreamBuilder(
                stream:
                    ProductRepository().getDataPenjual(snapshot.data![0].nama),
                builder: (context, snapshot2) {
                  if (snapshot2.hasError) {
                    return const Center(child: Text("Error"));
                  } else if (!snapshot2.hasData) {
                    return const Center(child: Text("Loading"));
                  } else {
                    final data = snapshot2.data;
                    return SizedBox(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                        ),
                        itemCount: data!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 160,
                            child: Card(
                              semanticContainer: true,
                              margin: const EdgeInsets.all(5),
                              shadowColor: Colors.blueGrey,
                              elevation: 4,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image:
                                              NetworkImage(data[index].gambar),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(data[index].nama,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  FormatTeks().changeFormat(
                                                      data[index].harga),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFDC0000),
        onPressed: () {
          _showAddProductDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddProductDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Produk Baru'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama Produk'),
                ),
                TextFormField(
                  controller: _deskripsiController,
                  decoration: const InputDecoration(labelText: 'Deskripsi'),
                ),
                TextFormField(
                  controller: _hargaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Harga'),
                ),
                TextFormField(
                  controller: _jenisController,
                  decoration: const InputDecoration(labelText: 'Jenis'),
                ),
                TextFormField(
                  controller: _gambarController,
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                    hintText:
                        "https://imgtr.ee/images/2023/12/15/dc235c410b1289b3b88c34b17b450fb5.jpeg",
                  ),
                ),
                // Widget untuk gambar produk (jika diperlukan)
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            StreamBuilder(
              stream: UserRepository()
                  .getData(FirebaseAuth.instance.currentUser!.email),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (!snapshot.hasData) {
                  return const Center(child: Text("Loading"));
                } else {
                  return TextButton(
                    onPressed: () {
                      _addProduct(snapshot.data![0].nama);
                    },
                    child: const Text('Simpan'),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditProductDialog(Map<String, dynamic> product, int index) {
    // Logika untuk menampilkan dialog edit produk
  }

  void _addProduct(String toko) {
    Products produk = Products(
      id: 'id',
      gambar: _gambarController.text,
      toko: toko,
      nama: _namaController.text,
      harga: int.parse(_hargaController.text),
      jenis: _jenisController.text,
      keterangan: _deskripsiController.text,
    );
    ProdukProvider().addProductList(produk: produk);
    setState(() {});

    _clearTextFields();
  }

  void _clearTextFields() {
    _namaController.clear();
    _deskripsiController.clear();
    _hargaController.clear();
    _jenisController.clear();
    _gambarController.clear();
  }
}
