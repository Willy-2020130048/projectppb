import 'package:flutter/material.dart';
import 'package:projectppb/Screens/Seller/customer_service_page.dart';
import 'package:projectppb/Screens/Seller/product_page.dart';
import 'package:projectppb/Screens/home_page.dart';
import 'package:projectppb/Screens/register_page.dart';


void main() {
  runApp(const MyApp());
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
