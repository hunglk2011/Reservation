import 'package:first_app/Screen/Signup.dart';
import 'package:first_app/Screen/forgotpass_screen.dart';
import 'package:first_app/Screen/home_screen.dart';
import 'package:first_app/Screen/login.dart';
import 'package:first_app/Screen/resetpass_screen.dart';
import 'package:first_app/Screen/verify_screen.dart';
import 'package:flutter/material.dart';

class Routenamed {
  static const String login = "/login";
  static const String signup = "/signup";
  static const String forgot = "/forgot";
  static const String verify = "/verify";
  static const String reset = "/reset";
  static const String homescreen = "/HomeScreen";

  static Route<dynamic>? generateRouted(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen());
      case homescreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case forgot:
        return MaterialPageRoute(
            builder: (context) => const ForgotpassScreen());
      case verify:
        return MaterialPageRoute(builder: (context) => const VerifyScreen());
      case reset:
        return MaterialPageRoute(builder: (context) => const ResetPassScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("404 - Page Not Found")),
          ),
        );
    }
  }
}
