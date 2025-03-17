import 'package:reservation_system/models/class/user.dart';

sealed class AuthenticationState {}

class AuthInitial extends AuthenticationState {}

class AuthLoading extends AuthenticationState {}

class AuththenticateSuccess extends AuthenticationState {
  final User user;
  AuththenticateSuccess({required this.user});
}

class AuthenticateFailure extends AuthenticationState {}
