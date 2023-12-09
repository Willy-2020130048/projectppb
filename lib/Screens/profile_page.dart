import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
          Container(
            width: double.infinity,
            color: Colors.red,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      "Nama Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding:  EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child:  Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Akun",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      ),
                  ListTile(
                    title: Text("Username"),
                    trailing: Text("Email"),
                  ),
                  ListTile(
                    title: Text("Nama"),
                    trailing: Text("Email"),
                  ),
                  ListTile(
                    title: Text("Nomor Telp"),
                    trailing: Text("Email"),
                  ),
                  ListTile(
                    title: Text("Alamat"),
                    trailing: Text("Email"),
                  ),
                  ListTile(
                    title: Text("Email"),
                    trailing: Text("Email"),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding:  EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child:  Column(
                children: [
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
          
          ],
      );
  }
}