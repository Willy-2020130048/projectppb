import 'package:flutter/material.dart';
import 'package:projectppb/Screens/Pembeli/cart_page.dart';
import 'package:projectppb/Screens/Pembeli/home_page.dart';
import 'package:projectppb/Screens/Pembeli/register_page.dart';
import 'package:provider/provider.dart';

import 'Providers/produk_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProdukProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const HomePage(),
      },
    );
  }
}
