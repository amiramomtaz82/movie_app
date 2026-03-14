import '../../../domain/models/user_dataModel.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoggedOut extends AuthState {}
class AuthNeedsRegistration extends AuthState {
  final String email;

  AuthNeedsRegistration(this.email);
}
class AuthAuthenticated extends AuthState {
  final UserDM user;
  AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {}
class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserDM user;
  AuthSuccess(this.user);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}