import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectppb/Models/users.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  Stream<List<UserData>> getData(String? email) => FirebaseFirestore.instance
      .collection("Users")
      .where("email", isEqualTo: email)
      .snapshots()
      .map((event) =>
          event.docs.map((e) => UserData.fromJson(e.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Nama Penjual")),
                  ListTile(
                    leading: Container(
                      width: 60,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "images/elektronik2.jpeg",
                          ),
                        ),
                      ),
                    ),
                    title: Column(
                      children: const [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Nama Produk"),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Harga"),
                        )
                      ],
                    ),
                    trailing: const Text("Sedang Dikirim"),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
