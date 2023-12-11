import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Models/users.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  User? _user;

  User? get user => _user;

  bool get isLoggedIn => _user != null;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = credential.user;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'INVALID_LOGIN_CREDENTIALS':
          throw 'Invalid login credentials.';
        default:
          rethrow;
      }
    }
    notifyListeners();
  }

  Future<void> register({
    required UserData user,
    required String password,
  }) async {
    await _db.collection("Users").add(user.toJson());
    await _auth.createUserWithEmailAndPassword(
      email: user.email,
      password: password,
    );
  }

  Future<void> logout() async {
    _user = null;

    await _auth.signOut();

    notifyListeners();
  }
}
