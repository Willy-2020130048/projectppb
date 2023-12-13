import 'package:flutter/material.dart';
import 'package:projectppb/Models/produks.dart';

class DetailProduk extends StatefulWidget {
  final Produk produk;

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
          image: AssetImage(widget.produk.gambar),
        ),
      ),
    );
  }

  Widget buildProductDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.produk.nama,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Harga: ${widget.produk.harga.toString()}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            'Jenis: ${widget.produk.jenis}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            'Keterangan: ${widget.produk.keterangan}',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildQuantitySection(),
          FloatingActionButton(
            onPressed: () {
              // Implementasi logika penambahan ke keranjang dengan jumlah produk sebanyak 'jumlah'
            },
            backgroundColor: const Color(0xFFDC0000),
            child: const Icon(Icons.add_shopping_cart),
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
