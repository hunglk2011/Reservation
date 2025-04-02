import 'package:reservation_system/models/class/user.dart';

sealed class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class LoginRequested extends AuthenticationEvent {
  final String phoneNumber;
  final String password;
  final String? email;

  LoginRequested({
    required this.phoneNumber,
    required this.password,
    this.email,
  });
}

class LogoutRequested extends AuthenticationEvent {}

class SignupRequested extends AuthenticationEvent {
  final User user;
  SignupRequested({required this.user});
}

class AuthInfoChanged extends AuthenticationEvent {
  final User userModel;

  AuthInfoChanged({required this.userModel});
}
