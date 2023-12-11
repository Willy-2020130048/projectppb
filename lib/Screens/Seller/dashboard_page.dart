import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dasbor Penjual'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            _buildSectionTitle('Ringkasan Penjualan'),
            _buildPenjualanSummary(),
            _buildSectionTitle('Analisis Performa Toko'),
            _buildGrafikPerforma(),
            _buildSectionTitle('Manajemen Produk'),
            _buildManajemenProduk(),
            _buildSectionTitle('Manajemen Pesanan'),
            _buildManajemenPesanan(),
            _buildSectionTitle('Manajemen Inventaris'),
            _buildManajemenInventaris(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Header Halaman Dasbor',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPenjualanSummary() {
    // Isi dengan widget ringkasan penjualan
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Jumlah Produk Terjual: 150'),
          Text('Pendapatan: Rp 500.000'),
          // Tambahan informasi penjualan lainnya
        ],
      ),
    );
  }

  Widget _buildGrafikPerforma() {
    // Isi dengan widget grafik performa toko
    return Container(
      // Widget grafik atau visualisasi performa toko
      padding: const EdgeInsets.all(16.0),
      child: const Placeholder(), // Ganti dengan widget yang sesuai
    );
  }

  Widget _buildManajemenProduk() {
    // Isi dengan widget manajemen produk
    return Container(
      // Widget untuk manajemen produk
      padding: const EdgeInsets.all(16.0),
      child: const Placeholder(), // Ganti dengan widget yang sesuai
    );
  }

  Widget _buildManajemenPesanan() {
    // Isi dengan widget manajemen pesanan
    return Container(
      // Widget untuk manajemen pesanan
      padding: const EdgeInsets.all(16.0),
      child: const Placeholder(), // Ganti dengan widget yang sesuai
    );
  }

  Widget _buildManajemenInventaris() {
    // Isi dengan widget manajemen inventaris
    return Container(
      // Widget untuk manajemen inventaris
      padding: const EdgeInsets.all(16.0),
      child: const Placeholder(), // Ganti dengan widget yang sesuai
    );
  }
}
