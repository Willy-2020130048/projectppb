import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/users.dart';

class UserRepository {
  Stream<List<UserData>> getData(String? email) => FirebaseFirestore.instance
      .collection("Users")
      .where("email", isEqualTo: email)
      .snapshots()
      .map((event) =>
          event.docs.map((e) => UserData.fromJson(e.data())).toList());
}
