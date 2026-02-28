import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/user_dataModel.dart';
import '../../domain/repos_auth.dart';
import 'cubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repo;

  AuthCubit(this.repo) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await repo.login(email, password);
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
  }) async {
    try {
      emit(AuthLoading());
      final user = await repo.register(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> googleLogin() async {
    try {
      emit(AuthLoading());

      final result = await repo.signInWithGoogle();

      if (result is UserDM) {
        // existing user
        emit(AuthSuccess(result));
      } else if (result is String) {
        // 🔥 new user → go register
        emit(AuthNeedsRegistration(result));
      }
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