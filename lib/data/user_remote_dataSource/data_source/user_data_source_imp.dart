import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/user_remote_dataSource/data_source/user_data_source.dart';
@Injectable( as: UserRemoteDataSource)
class UserRemoteDataSourceImp extends UserRemoteDataSource{

  final FirebaseFirestore firestore;

  UserRemoteDataSourceImp(this.firestore);

  Future<void> addFavorite(String movieId) async {
    var uid = FirebaseAuth.instance.currentUser!.uid;

    await firestore.collection("users").doc(uid).update({
      "favoriteMovies": FieldValue.arrayUnion([movieId])
    });
  }

  Future<void> removeFavorite(String movieId) async {
    var uid = FirebaseAuth.instance.currentUser!.uid;

    await firestore.collection("users").doc(uid).update({
      "favoriteMovies": FieldValue.arrayRemove([movieId])
    });
  }

  Future<void> addHistory(String movieId) async {
    var uid = FirebaseAuth.instance.currentUser!.uid;

    await firestore.collection("users").doc(uid).set({
      "historyMovies": FieldValue.arrayUnion([movieId])
    }, SetOptions(merge: true));
  }

  @override
  Future<List<String>> getHistoryMovieIds(String userId) async {
    final doc =
    await firestore.collection("users").doc(userId).get();

    final List ids = doc.data()?["historyMovies"] ?? [];

    return List<String>.from(doc.data()?["historyMovies"] ?? []);
  }

  Future<List<String>> getFavoriteMovieIds(String userId) async {

    var doc = await firestore
        .collection("users")
        .doc(userId)
        .get();

    return List<String>.from(doc.data()?["favoriteMovies"] ?? []);
  }
}