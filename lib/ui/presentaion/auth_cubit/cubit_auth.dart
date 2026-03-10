import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/user_dataModel.dart';
import '../../../domain/reopsotries/repos_auth.dart';
import 'cubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repo;

  AuthCubit(this.repo) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await repo.login(email, password);
      UserDM.currentUser = user;
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }


  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String image
  }) async {
    try {
      emit(AuthLoading());
      final UserDM user = await repo.register(
          email: email,
          password: password,
          name: name,
          phone: phone,
          image: image

      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(AuthLoading());
    print("Google login started"); // 🔹
    try {
      final user = await repo.signInWithGoogle();
      print("Google user: $user"); // 🔹
      if (user != null) {
        UserDM.currentUser = user;
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      print("Google login error: $e"); // 🔹
      emit(AuthError(e.toString()));
    }
  }
    /// Update profile (name, phone, optional avatar)
    Future<void> updateUser({
      required String name,
      required String phone,
      String? avatar,
    }) async {
      final currentUser = UserDM.currentUser;

      if (currentUser == null) {
        emit(AuthError("No logged in user"));
        return;
      }

      emit(AuthLoading());

      try {
        final data = {
          "name": name,
          "phone": phone,
          if (avatar != null) "image": avatar,
        };

        await repo.updateUser(currentUser.id, data);

        emit(AuthSuccess(UserDM.currentUser!));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    }


    Future<void> resetPassword(String email) async {
      try {
        emit(AuthLoading());
        await repo.resetPassword(email);
        emit(AuthInitial());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    }


    Future<void> logout() async {
      await repo.logout();
      emit(AuthInitial());
    }
  }
