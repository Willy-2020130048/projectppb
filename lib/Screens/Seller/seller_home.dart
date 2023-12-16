import 'package:flutter/material.dart';
import 'package:projectppb/Screens/Seller/product_page.dart';
import 'package:projectppb/Screens/Seller/transaksi_penjual.dart';

import '../Pembeli/profile_page.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({super.key});

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProductPage(),
    TransaksiPenjual(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDC0000),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(-10.0),
            child: Container(
              height: 4,
              color: const Color(0xFFDC0000).withOpacity(0.2),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFDC0000),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'List Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment,
                color: Colors.white,
              ),
              label: 'Transaksi',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        body: _widgetOptions[_selectedIndex]);
  }
}
