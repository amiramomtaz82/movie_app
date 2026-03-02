import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/data/user_dataModel.dart';

import '../domain/repos_auth.dart';
import 'dataSource_firebase_auth.dart';
import 'dataSource_firestore.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource auth;
  final FirestoreDataSource firestore;

  AuthRepositoryImpl(this.auth, this.firestore);

  // LOGIN
  @override
  Future<UserDM> login(String email, String password) async {
    final cred = await auth.login(email, password);
    final user = await firestore.getUser(cred.user!.uid);

    if (user == null) {
      throw Exception("User not found in Firestore");
    }

    return user;
  }
  // REGISTER
  @override
  Future<UserDM> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String image,
  }) async {
    final cred = await auth.register(email, password);

    final user = UserDM(
        id: cred.user!.uid,
        email: email,
        name: name,
        phone: phone,
        image: image,
        favoriteMovies: [],
        historyMovies: []
    );

    await firestore.createUser(user);
    return user;
  }

  // GOOGLE
  @override
  // Future<dynamic> signInWithGoogle() async {

  //
  //
  //
  //
  //   }




  @override
  // Future<dynamic> signInWithGoogle() async {
  //
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   await googleSignIn.signOut();
  //   final UserCredential cred = await auth.signInWithGoogleAuth();
  //   final user = cred.user!;
  //
  //   // Use your custom FirestoreDataSource
  //   final existingUser = await firestore.getUser(user.uid);
  //
  //   if (existingUser != null) {
  //     return existingUser; // UserDM
  //   } else {
  //     return user.email ?? ""; // new user
  //   }
  // }

  Future<UserDM?> signInWithGoogle() async {
    return await auth.signInWithGoogle();
  }
  @override
  Future<void> resetPassword(String email) =>
      auth.resetPassword(email);

  @override
  Future<void> logout() => auth.logout();
}
