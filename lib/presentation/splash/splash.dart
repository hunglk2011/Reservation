import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_event.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/routes/route_named.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthenticationBloc>().add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuththenticateSuccess) {
            Navigator.pushReplacementNamed(context, Routenamed.homescreen);
          } else if (state is AuthenticateFailure || state is AuthInitial) {
            Timer(const Duration(seconds: 3), () {
              Navigator.pushReplacementNamed(context, Routenamed.onboard);
            });
          }
        },
        child: Center(
          child: Image.asset(
            Assets.images.imgLogoBbq.path,
            width: 211,
            height: 102,
          ),
        ),
      ),
    );
  }
}
