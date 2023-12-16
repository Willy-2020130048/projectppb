import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectppb/Database/cart_repository.dart';
import 'package:projectppb/Database/product_repository.dart';
import 'package:projectppb/Models/products.dart';

import '../../Models/teks.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalBayar = 0;

  @override
  void initState() {
    super.initState();
  }

  int getTotal(List<Products> produks) {
    int total = 0;
    for (var produk in produks) {
      total += produk.harga;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    Future<String> deleteCart(AsyncSnapshot snapshot2) async {
      return await CartRepository().getDoc(
          FirebaseAuth.instance.currentUser?.email, snapshot2.data![0].id);
    }

    Future<void> checkout() async {
      CartRepository().checkoutCart(FirebaseAuth.instance.currentUser!.email);
      Navigator.of(context).pop();
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color(0xFFDC0000),
          title: const Text(
            "Cart",
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: Column(
          children: <Widget>[
            StreamBuilder(
                stream: CartRepository().getDataCart(
                    FirebaseAuth.instance.currentUser?.email ?? ''),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text("No Data"));
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Expanded(
                    flex: 10,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return StreamBuilder(
                            stream: ProductRepository()
                                .getFromId(snapshot.data![index].idProduk),
                            builder: (context, snapshot2) {
                              if (!snapshot2.hasData) {
                                return const Text("No Data");
                              } else if (snapshot2.hasError) {
                                return Text(snapshot2.error.toString());
                              }
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8.0,
                                      left: 16.0,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        snapshot2.data![0].toko,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 120,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0,
                                          top: 10.0,
                                          right: 16.0,
                                          bottom: 20.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(snapshot2
                                                      .data![0].gambar),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        snapshot2.data![0].nama,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        "${FormatTeks().changeFormat(snapshot2.data![0].harga)} x ${snapshot.data![index].jumlah}",
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                FormatTeks().changeFormat(
                                                    snapshot2.data![0].harga *
                                                        snapshot.data![index]
                                                            .jumlah),
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: FutureBuilder(
                                              future: deleteCart(snapshot2),
                                              builder: (context, snapshot3) {
                                                if (snapshot3.hasError) {
                                                  return const Text("error");
                                                } else {
                                                  return IconButton(
                                                    onPressed: () {
                                                      FirebaseFirestore.instance
                                                          .collection("Charts")
                                                          .doc(snapshot3.data)
                                                          .delete();
                                                    },
                                                    icon: const Icon(
                                                      Icons.remove_circle,
                                                      color: Colors.red,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                  );
                }),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDC0000),
                    padding: const EdgeInsets.all(8.0),
                  ),
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Purchased'),
                        content: const Text('Barang berhasil dibeli.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => checkout(),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Checkout",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
