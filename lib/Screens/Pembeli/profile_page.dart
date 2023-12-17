import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uas_ppb_1/Database/user_repository.dart';

import '../../auth_guard.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          UserRepository().getData(FirebaseAuth.instance.currentUser?.email),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          return Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          data[0].nama,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Akun",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text("Nama"),
                        trailing: Text(data[0].nama),
                      ),
                      ListTile(
                        title: const Text("Email"),
                        trailing: Text(data[0].email),
                      ),
                      ListTile(
                        title: const Text("Nomor Telp"),
                        trailing: Text(data[0].handphone),
                      ),
                      ListTile(
                        title: const Text("Alamat"),
                        trailing: Text(data[0].alamat),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Transaksi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text("History Pembelian"),
                        trailing: Icon(Icons.arrow_right),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDC0000),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const AuthGuard()));
                      });
                    },
                    child: const Text("Logout"),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text("Loading"));
        }
      },
    );
  }
}
