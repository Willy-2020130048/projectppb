import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectppb/Database/cart_repository.dart';
import 'package:projectppb/Models/teks.dart';

import '../../Database/product_repository.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: CartRepository()
          .getDataTransaksi(FirebaseAuth.instance.currentUser!.email),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (!snapshot.hasData) {
          return const Center(child: Text("Loading"));
        }
        return Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return StreamBuilder(
                stream: ProductRepository()
                    .getFromId(snapshot.data![index].idProduk),
                builder: (context, snapshot2) {
                  if (snapshot2.hasError) {
                    return Text(snapshot2.error.toString());
                  } else if (!snapshot2.hasData) {
                    return const Text("Tidak ada transaksi");
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, bottom: 8.0),
                              child: Text(snapshot2.data![0].toko),
                            )),
                        ListTile(
                          leading: Container(
                            width: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(snapshot2.data![0].gambar),
                              ),
                            ),
                          ),
                          title: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  snapshot2.data![0].nama,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(FormatTeks()
                                    .changeFormat(snapshot2.data![0].harga)),
                              )
                            ],
                          ),
                          trailing: Text(snapshot.data![index].status),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
