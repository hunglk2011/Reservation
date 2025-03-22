import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_event.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/models/class/user.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthInitial()) {
    on<AppStarted>((event, emit) {
      final String? userString = AppPreference.prefs?.getString("userKey");

      if (userString != null && userString.isNotEmpty) {
        final Map<String, dynamic> json = jsonDecode(userString);
        final User user = User.fromJson(json);
        emit(AuththenticateSuccess(user: user));
      } else {
        emit(AuthInitial());
      }
    });

    on<SignupRequested>((event, emit) async {
      final user = User(
        name: event.user.name,
        phoneNumber: event.user.phoneNumber,
        password: event.user.password,
      );

      await AppPreference.prefs?.setString(
        "userKey",
        jsonEncode(user.toJson()),
      );

      emit(AuththenticateSuccess(user: user));
    });

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 2));

      final String? userString = AppPreference.prefs?.getString("userKey");

      if (userString != null && userString.isNotEmpty) {
        final Map<String, dynamic> json = jsonDecode(userString);
        final User user = User.fromJson(json);

        if (user.phoneNumber == event.phoneNumber &&
            user.password == event.password) {
          emit(AuththenticateSuccess(user: user));
        } else {
          emit(AuthenticateFailure());
        }
      } else {
        emit(AuthenticateFailure());
      }
    });

    on<LogoutRequested>((event, emit) async {
      await AppPreference.prefs?.remove("userKey");
      emit(AuthInitial());
    });

    on<AuthInfoChanged>((event, emit) async {
      if (state is AuththenticateSuccess) {
        var newState = state as AuththenticateSuccess;

        var newData = newState.user.copyWith(
          email: event.userModel.email,
          phone: event.userModel.phoneNumber,
          name: event.userModel.name,
          password: event.userModel.password,
        );
        await AppPreference.updateData(newData, "userKey");

        emit(AuththenticateSuccess(user: newData));
      }
    });
  }
}
