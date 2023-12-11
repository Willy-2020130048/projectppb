import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectppb/Screens/Pembeli/home_page.dart';
import 'package:projectppb/Screens/Pembeli/login_page.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
