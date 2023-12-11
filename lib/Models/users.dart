import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String? id;
  String email;
  String nama;
  String alamat;
  String handphone;
  String? rekening;
  String roles;

  UserData({
    this.id,
    required this.email,
    required this.nama,
    required this.alamat,
    required this.handphone,
    this.rekening,
    required this.roles,
  });

  UserData.fromJson(Map<String, dynamic> json)
      : email = json["email"],
        nama = json["nama"],
        alamat = json["alamat"],
        handphone = json["handphone"],
        rekening = json["rekening"],
        roles = json["roles"];

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "nama": nama,
      "alamat": alamat,
      "handphone": handphone,
      "rekening": rekening,
      "roles": roles,
    };
  }

  factory UserData.fromDoc(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserData(
      email: data["email"],
      nama: data["nama"],
      alamat: data["alamat"],
      handphone: data["handpphone"],
      roles: data["roles"],
    );
  }
}
