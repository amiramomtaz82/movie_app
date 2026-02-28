import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/data/user_dataModel.dart';

class FirestoreDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserDM user) async {
    await firestore.collection("users").doc(user.id).set(user.toJson());
  }

  Future<UserDM> getUser(String uid) async {
    final doc = await firestore.collection("users").doc(uid).get();

    if (!doc.exists) throw Exception("User not found");

    return UserDM.fromJson(doc.data()!);
  }
  Future <bool> checkUserExists(String uid) async {
    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get();

    return doc.exists;
  }
}