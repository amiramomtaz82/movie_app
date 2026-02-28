import 'package:firebase_auth/firebase_auth.dart';

import '../data/user_dataModel.dart';


abstract class AuthRepository {
  Future<UserDM> login(String email, String password);

  Future<UserDM> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  });


  Future<dynamic> signInWithGoogle();

  Future<void> resetPassword(String email);

  Future<void> logout();
}