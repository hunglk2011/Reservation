import 'dart:async';
import 'package:first_app/Routes/routenamed.dart';
import 'package:flutter/material.dart';

import '../../Models/onboard_services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        final isFirstOpen = OnboardService.isFirstOpen();
        if (isFirstOpen) {
          Navigator.pushReplacementNamed(context, Routenamed.onboard);
        } else {
          Navigator.pushReplacementNamed(context, Routenamed.homescreen);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'asset/Logo.png',
          width: 211,
          height: 102,
        ),
      ),
    );
  }
}
