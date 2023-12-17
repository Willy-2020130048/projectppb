import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uas_ppb_1/Providers/produk_provider.dart';
import 'package:uas_ppb_1/Screens/Pembeli/home_page.dart';
import 'package:uas_ppb_1/Screens/Pembeli/register_page.dart';
import 'package:uas_ppb_1/auth_guard.dart';
import 'package:provider/provider.dart';
import 'Providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBnP0XmcNDMDiRYjzj0oYEBenfQ2NjgU2c',
      appId: '1:769062312568:android:1961afbf60c79f958ceb8d',
      messagingSenderId: '769062312568',
      projectId: 'projectppb-73d27',
      storageBucket: 'projectppb-73d27.appspot.com',
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProdukProvider>(
          create: (_) => ProdukProvider(),
        ),
        Provider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
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
      theme: ThemeData(
        primaryColor: const Color(0xFFDC0000),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthGuard(),
        '/register': (context) => const RegisterPage(),
        '/homepembeli': (context) => const HomePage(),
      },
    );
  }
}
