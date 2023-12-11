import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/users.dart';

class UserRepository {
  Future<UserData> getUserData(String? email) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("Users")
        .where("email", isEqualTo: email)
        .get();
    final UserData userData =
        snapshot.docs.map((e) => UserData.fromDoc(e)).single;
    return userData;
  }
}
