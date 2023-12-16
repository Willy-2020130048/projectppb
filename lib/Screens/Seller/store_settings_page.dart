import 'package:flutter/material.dart';

class StoreSettingsPage extends StatefulWidget {
  const StoreSettingsPage({super.key});

  @override
  _StoreSettingsPageState createState() => _StoreSettingsPageState();
}

class _StoreSettingsPageState extends State<StoreSettingsPage> {
  final String _storeImage =
      'assets/store_image.jpg'; // Simpan URL gambar profil toko
  String _storeDescription = 'Deskripsi toko'; // Deskripsi singkat toko
  String _storeAddress = 'Alamat toko'; // Alamat toko

  String _paymentMethod =
      'Metode pembayaran'; // Metode pembayaran yang diterima
  String _bankInfo = 'Informasi rekening'; // Informasi rekening

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _paymentMethodController =
      TextEditingController();
  final TextEditingController _bankInfoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Mengisi data yang ada ke dalam field
    _descriptionController.text = _storeDescription;
    _addressController.text = _storeAddress;
    _paymentMethodController.text = _paymentMethod;
    _bankInfoController.text = _bankInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Toko'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Profil Toko',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(_storeImage),
            ),
            const SizedBox(height: 10),
            Text('Deskripsi: $_storeDescription'),
            Text('Alamat: $_storeAddress'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _editStoreProfile(context);
              },
              child: const Text('Edit Profil Toko'),
            ),
            const SizedBox(height: 20),
            const Text('Pengaturan Pembayaran',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextFormField(
              controller: _paymentMethodController,
              decoration: const InputDecoration(labelText: 'Metode Pembayaran'),
              onChanged: (value) {
                _paymentMethod = value;
              },
            ),
            TextFormField(
              controller: _bankInfoController,
              decoration:
                  const InputDecoration(labelText: 'Informasi Rekening'),
              onChanged: (value) {
                _bankInfo = value;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveStoreSettings();
              },
              child: const Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }

  void _editStoreProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditStoreProfilePage(
                storeDescription: _storeDescription,
                storeAddress: _storeAddress,
                onProfileUpdated: _updateProfileDetails,
              )),
    );
  }

  void _updateProfileDetails(String description, String address) {
    setState(() {
      _storeDescription = description;
      _storeAddress = address;
    });
  }

  void _saveStoreSettings() {
    // Logika untuk menyimpan perubahan pada profil toko dan pengaturan pembayaran
    // Simpan _storeDescription, _storeAddress, _paymentMethod, _bankInfo ke penyimpanan
    // Contoh penyimpanan menggunakan shared_preferences atau penyimpanan lainnya

    // Simpan data yang diubah ke variabel state agar terupdate di layar
    setState(() {
      _paymentMethod = _paymentMethodController.text;
      _bankInfo = _bankInfoController.text;
    });

    // Tampilkan pesan notifikasi atau perubahan berhasil disimpan
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perubahan berhasil disimpan')));
  }
}

class EditStoreProfilePage extends StatefulWidget {
  final String storeDescription;
  final String storeAddress;
  final Function(String, String) onProfileUpdated;

  const EditStoreProfilePage({
    super.key,
    required this.storeDescription,
    required this.storeAddress,
    required this.onProfileUpdated,
  });

  @override
  _EditStoreProfilePageState createState() => _EditStoreProfilePageState();
}

class _EditStoreProfilePageState extends State<EditStoreProfilePage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _descriptionController.text = widget.storeDescription;
    _addressController.text = widget.storeAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil Toko'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Deskripsi Singkat'),
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Alamat Toko'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String description = _descriptionController.text;
                String address = _addressController.text;
                widget.onProfileUpdated(description, address);
                Navigator.pop(context);
              },
              child: const Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
