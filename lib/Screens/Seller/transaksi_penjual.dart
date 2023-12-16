import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectppb/Database/cart_repository.dart';

import '../../Database/product_repository.dart';
import '../../Database/user_repository.dart';

class TransaksiPenjual extends StatefulWidget {
  const TransaksiPenjual({super.key});

  @override
  State<TransaksiPenjual> createState() => _TransaksiPenjualState();
}

class _TransaksiPenjualState extends State<TransaksiPenjual> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          UserRepository().getData(FirebaseAuth.instance.currentUser!.email),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        } else if (!snapshot.hasData) {
          return const Center(child: Text("Loading"));
        } else {
          return StreamBuilder(
              stream: CartRepository()
                  .getDataTransaksiPenjual(snapshot.data![0].nama),
              builder: (context, snapshot2) {
                if (snapshot2.hasError) {
                  return const Center(child: Text("Error"));
                } else if (!snapshot2.hasData) {
                  return const Center(child: Text("Loading"));
                } else {
                  final data = snapshot2.data;
                  return Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot2.data?.length,
                      itemBuilder: (context, index) {
                        return StreamBuilder(
                          stream: ProductRepository()
                              .getFromId(data![index].idProduk),
                          builder: (context, snapshot3) {
                            if (snapshot3.hasError) {
                              return Text(snapshot3.error.toString());
                            } else if (!snapshot3.hasData) {
                              return const Center(
                                  child: Text("Tidak Ada Transaksi"));
                            }
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(snapshot3.data![0].toko)),
                                  ListTile(
                                    leading: Container(
                                      width: 60,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              snapshot3.data![0].gambar),
                                        ),
                                      ),
                                    ),
                                    title: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(snapshot3.data![0].nama),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(snapshot3.data![0].harga
                                              .toString()),
                                        )
                                      ],
                                    ),
                                    trailing: Text(data[index].status),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }
              });
        }
      },
    );
  }
}
