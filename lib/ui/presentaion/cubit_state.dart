import '../../data/user_dataModel.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthNeedsRegistration extends AuthState {
  final String email;

  AuthNeedsRegistration(this.email);
}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserDM user;
  AuthSuccess(this.user);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}