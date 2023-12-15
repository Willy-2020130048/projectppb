class Produk {
  String gambar;
  String toko;
  String nama;
  String jenis;
  int harga;
  String keterangan;
  int jumlah;
  int total;

  Produk({
    required this.gambar,
    required this.toko,
    required this.nama,
    required this.harga,
    required this.jenis,
    required this.keterangan,
    required this.jumlah,
    required this.total,
  });

  Produk.fromJson(Map<String, dynamic> json)
      : gambar = json['gambar'],
        toko = json['toko'],
        nama = json['nama'],
        harga = json['harga'],
        jenis = json['jenis'],
        keterangan = json['keterangan'],
        jumlah = json['jumlah'],
        total = json['total'];

  Map<String, dynamic> toJson() {
    return {
      'gambar': gambar,
      'toko': toko,
      'nama': nama,
      'harga': harga,
      'jenis': jenis,
      'keterangan': keterangan,
      'jumlah': jumlah,
      'total': total
    };
  }
}
