import 'package:flutter/material.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))
            ),
            child: const Padding(
              padding:  EdgeInsets.all(8.0),
              child:  Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Nama Penjual")),
                  ListTile(
                    leading: SizedBox(width: 60,),
                    title: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Nama Produk"),),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Harga"),)
                      ],
                    ),
                    trailing: Text("Sedang Dikirim"),
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