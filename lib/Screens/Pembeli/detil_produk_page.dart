import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectppb/Models/products.dart';
import 'package:projectppb/Models/teks.dart';
import 'package:projectppb/Providers/produk_provider.dart';

class DetailProduk extends StatefulWidget {
  final Products produk;

  const DetailProduk({super.key, required this.produk});

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  int jumlah = 1; // Jumlah awal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'Detail Produk',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFDC0000),
    );
  }

  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildProductImage(),
        buildProductDetails(),
        const Expanded(child: SizedBox()),
        buildBottomSection(),
      ],
    );
  }

  Widget buildProductImage() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.produk.gambar),
        ),
      ),
    );
  }

  Widget buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
          child: Text(
            widget.produk.nama,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Text(
            FormatTeks().changeFormat(widget.produk.harga),
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(),
              bottom: BorderSide(),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
            child: Row(
              children: [
                const CircleAvatar(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.produk.toko.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Text(
            widget.produk.keterangan,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildQuantitySection(),
          ElevatedButton(
            onPressed: () {
              ProdukProvider().addToCart(
                id: widget.produk.id,
                penjual: widget.produk.toko,
                jumlah: jumlah,
                user: FirebaseAuth.instance.currentUser?.email ?? '',
              );
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Cart'),
                  content: const Text('Barang telah dimasukan ke cart.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC0000),
            ),
            child: const Text("Add To Cart"),
          ),
        ],
      ),
    );
  }

  Widget buildQuantitySection() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (jumlah > 1) jumlah--;
            });
          },
          icon: const Icon(Icons.remove),
          color: const Color(0xFFDC0000),
        ),
        SizedBox(
          width: 50,
          child: Center(
            child: Text(
              jumlah.toString(),
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              jumlah++;
            });
          },
          icon: const Icon(Icons.add),
          color: const Color(0xFFDC0000),
        ),
      ],
    );
  }
}
