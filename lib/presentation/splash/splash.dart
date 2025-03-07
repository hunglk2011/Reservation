import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/routes/route_named.dart';
import 'package:reservation_system/services/onboard_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      final isFirstOpen = OnboardService.isFirstOpen();
      if (isFirstOpen) {
        Navigator.pushReplacementNamed(context, Routenamed.onboard);
      } else {
        Navigator.pushReplacementNamed(context, Routenamed.homescreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.images.imgLogoBbq.path,
          width: 211,
          height: 102,
        ),
      ),
    );
  }
}
