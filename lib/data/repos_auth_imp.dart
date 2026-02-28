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
    return firestore.getUser(cred.user!.uid);
  }

  // REGISTER
  @override
  Future<UserDM> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final cred = await auth.register(email, password);

    final user = UserDM(
      id: cred.user!.uid,
      email: email,
      name: name,
      phone: phone,
      image: null,
      favoriteMovies: [],
        historyMovies:[]
    );

    await firestore.createUser(user);
    return user;
  }

  // GOOGLE
  @override
  Future<dynamic> signInWithGoogle() async {
    final cred = await auth.signInWithGoogle();

    final firebaseUser = cred.user!;

    try {
      return await firestore.getUser(firebaseUser.uid);
    } catch (_) {
      return firebaseUser.email;

  }
  }

  @override
  Future<void> resetPassword(String email) =>
      auth.resetPassword(email);

  @override
  Future<void> logout() => auth.logout();
}