import 'package:first_app/presentation/forgotpass_screen.dart';
import 'package:first_app/presentation/home/home_page.dart';
import 'package:first_app/presentation/login.dart';
import 'package:first_app/presentation/onboard/onboard_screen.dart';
import 'package:first_app/presentation/resetpass_screen.dart';
import 'package:first_app/presentation/signup.dart';
import 'package:first_app/presentation/splash/splash_screen.dart';
import 'package:first_app/presentation/verify_screen.dart';
import 'package:flutter/material.dart';

class Routenamed {
  static const String login = "/login";
  static const String signup = "/signup";
  static const String forgot = "/forgot";
  static const String verify = "/verify";
  static const String reset = "/reset";
  static const String onboard = "/onboard";
  static const String homescreen = "/HomeScreen";
  static const String splash = "/splash";

  static Route<dynamic>? generateRouted(RouteSettings settings) {
    switch (settings.name) {
      case login:
        final dataReset = settings.arguments as Map<String, dynamic>?;
        final passKey = dataReset?["newPass"] as String? ?? "";
        return MaterialPageRoute(
          builder: (context) => LoginScreen(
            newPassword: passKey,
          ),
        );

      case signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen());

      case homescreen:
        final data = settings.arguments as Map<String, dynamic>?;
        final name = data?["nameKey"] as String?;
        final email = data?["emailKey"] as String? ?? "";

        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomePage(
            name: name,
            email: email,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

      case forgot:
        return MaterialPageRoute(
            builder: (context) => const ForgotpassScreen());

      case verify:
        final dataForgot = settings.arguments as Map<String, dynamic>;
        final phoneNumber = dataForgot["phoneNumKey"] as String;
        return MaterialPageRoute(
            builder: (context) => VerifyScreen(
                  phoneNumber: phoneNumber,
                ));

      case reset:
        return MaterialPageRoute(builder: (context) => const ResetPassScreen());

      case onboard:
        return MaterialPageRoute(builder: (context) => const OnboardScreen());

      case splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("404 - Page Not Found")),
          ),
        );
    }
  }
}
