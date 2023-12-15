import '../Models/produks.dart';

class RepositoryProduk {
  List<Produk> list = [
    Produk(
        gambar: 'images/hiasan1.jpeg',
        toko: 'RokuWear',
        nama: 'Costume Hu Tao',
        harga: 150000,
        jenis: 'Costume',
        keterangan:
            "Penyewaan costume Hu Tao, termasuk baju, celana, sepatu, topi dan wig. Penyewaan dengan durasi 3 hari dan harus langsung dikembalikan atau dikenakan denda 50.000",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/hiasan1.jpeg',
        toko: 'RokuWear',
        nama: 'Costume Zero Two',
        harga: 100000,
        jenis: 'Costume',
        keterangan:
            "Penyewaan costume Zero Two, termasuk baju, celana dan wig. Penyewaan dengan durasi 3 hari dan harus langsung dikembalikan atau dikenakan denda 50.000",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/hiasan1.jpeg',
        toko: 'RokuWear',
        nama: 'Costume Gura',
        harga: 100000,
        jenis: 'Costume',
        keterangan:
            "Penyewaan costume Gura, termasuk hoodie dan wig. Penyewaan dengan durasi 3 hari dan harus langsung dikembalikan atau dikenakan denda 50.000",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/hiasan1.jpeg',
        toko: 'RokuWear',
        nama: 'Wig Kazuha',
        harga: 50000,
        jenis: 'Wig',
        keterangan:
            "Penyewaan wig Kazuha, penyewaan dengan durasi 3 hari dan harus langsung dikembalikan atau dikenakan denda 50.000",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/hiasan1.jpeg',
        toko: 'RokuWear',
        nama: 'Wig Maki',
        harga: 50000,
        jenis: 'Wig',
        keterangan:
            "Penyewaan wig Maki, penyewaan dengan durasi 3 hari dan harus langsung dikembalikan atau dikenakan denda 50.000",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/hiasan1.jpeg',
        toko: 'RokuWear',
        nama: 'Wig Neon Genesis',
        harga: 50000,
        jenis: 'Wig',
        keterangan:
            "Penyewaan wig Neon Genesis, penyewaan dengan durasi 3 hari dan harus langsung dikembalikan atau dikenakan denda 50.000",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/hiasan1.jpeg',
        toko: 'RokuWear',
        nama: 'Senjata Sword Gun',
        harga: 65000,
        jenis: 'Acc',
        keterangan:
            "Penyewaan senjata AOT, senjata terbuat dari alumunium. Penyewaan dengan durasi 3 hari dan harus langsung dikembalikan atau dikenakan denda 50.000",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/hiasan1.jpeg',
        toko: 'RokuWear',
        nama: 'Staff of Homa',
        harga: 65000,
        jenis: 'Acc',
        keterangan:
            "Penyewaan Staff of Homa dari genshin impact. Penyewaan dengan durasi 3 hari dan harus langsung dikembalikan atau dikenakan denda 50.000",
        jumlah: 0,
        total: 0),
    Produk(
        gambar: 'images/hiasan1.jpeg',
        toko: 'RokuWear',
        nama: 'Topi One Piece',
        harga: 50000,
        jenis: 'Acc',
        keterangan:
            "Penyewaan topi bajak laut luffy terbuat dari jerami. Penyewaan dengan durasi 3 hari dan harus langsung dikembalikan atau dikenakan denda 50.000",
        jumlah: 0,
        total: 0),
  ];

  List<Produk> getListByJenis(String jenis) {
    List<Produk> temp = [];
    for (var produk in list) {
      if (jenis == "All") {
        temp.addAll(list);
      } else if (produk.jenis == jenis) {
        temp.add(produk);
      }
    }
    return temp;
  }
}
