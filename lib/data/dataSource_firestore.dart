import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/domain/models/user_dataModel.dart';

class FirestoreDataSource {
  final FirebaseFirestore firestore
;
  FirestoreDataSource({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await firestore.collection('users').doc(uid).update(data);
  }


  Future<void> createUser(UserDM user) async {
    await firestore.collection("users").doc(user.id).set(user.toJson());
  }


  Future<UserDM?> getUser(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      return UserDM.fromJson(doc.data()!);
    } else {
      return null;
    }
  }
  Future <bool> checkUserExists(String uid) async {
    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get();

    return doc.exists;
  }
}