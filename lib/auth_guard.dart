import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectppb/Models/users.dart';
import 'package:projectppb/Screens/Pembeli/home_page.dart';
import 'package:projectppb/Screens/Pembeli/login_page.dart';
import 'Database/user_repository.dart';
import 'Screens/Seller/seller_home.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return StreamBuilder<List<UserData>>(
            stream: UserRepository().getData(snapshot.data!.email),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data![0].roles == "Pembeli") {
                  return const HomePage();
                } else {
                  return const SellerHome();
                }
              }
              return Container(
                  color: Colors.white60,
                  child: const Center(child: Text("Loading")));
            },
          );
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
