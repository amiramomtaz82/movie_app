import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRemoteDataSource {



  Future<void> addFavorite(String movieId) ;

  Future<void> removeFavorite(String movieId) ;

  Future<void> addHistory(String movieId);
  Future<List<String>> getHistoryMovieIds(String userId);
  Future<List<String>> getFavoriteMovieIds(String userId);
}