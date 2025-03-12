import 'package:flutter/material.dart';
import 'package:reservation_system/presentation/forgot_password/forgot_password_screen.dart';
import 'package:reservation_system/presentation/home/home_screen.dart';
import 'package:reservation_system/presentation/login/login_screen.dart';
import 'package:reservation_system/presentation/notification/notification_screen.dart';
import 'package:reservation_system/presentation/onboard/onboard_screen.dart';
import 'package:reservation_system/presentation/reservation/reservation_screen.dart';
import 'package:reservation_system/presentation/reset_password/reset_pass_screen.dart';
import 'package:reservation_system/presentation/restaurant/restaurant_list.dart';
import 'package:reservation_system/presentation/see_all/best_seller/best_seller_screen.dart';
import 'package:reservation_system/presentation/signup/signup_screen.dart';
import 'package:reservation_system/presentation/splash/splash.dart';
import 'package:reservation_system/presentation/verify_otp/verify_otp_screen.dart';

class Routenamed {
  static const String login = "/login";
  static const String signup = "/signup";
  static const String forgot = "/forgot";
  static const String verify = "/verify";
  static const String reset = "/reset";
  static const String onboard = "/onboard";
  static const String homescreen = "/HomeScreen";
  static const String splash = "/splash";
  static const String notify = "/notify";
  static const String seeAllBestSeller = "/bestSeller";
  static const String seeAllRestaurant = "/restaurant";
  static const String reservationscreen = "/reservation";

  static Route<dynamic>? generateRouted(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case onboard:
        return MaterialPageRoute(builder: (context) => const OnboardScreen());

      case login:
        final dataReset = settings.arguments as Map<String, dynamic>?;
        final passKey = dataReset?["passKey"] as String? ?? "";
        final phoneKey = dataReset?["phoneKey"] as String? ?? "";
        final nameKey = dataReset?["nameKey"] as String? ?? "";
        final emailKey = dataReset?["emailKey"] as String? ?? "";
        return MaterialPageRoute(
          builder:
              (context) => LoginScreen(
                newPassword: passKey,
                phoneNumber: phoneKey,
                name: nameKey,
                email: emailKey,
              ),
        );

      case signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen());

      case forgot:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );

      case verify:
        final dataForgot = settings.arguments as Map<String, dynamic>;
        final phoneNumber = dataForgot["phoneNumKey"] as String;
        return MaterialPageRoute(
          builder: (context) => VerifyScreen(phoneNumber: phoneNumber),
        );

      case reset:
        return MaterialPageRoute(builder: (context) => const ResetPassScreen());

      case homescreen:
        final data = settings.arguments as Map<String, dynamic>?;
        final name = data?["nameKey"] as String?;
        final email = data?["emailKey"] as String? ?? "";
        // final passKey = data?["passKey"] as String? ?? "";

        return PageRouteBuilder(
          pageBuilder:
              (context, animation, secondaryAnimation) =>
                  HomeScreen(name: name, email: email),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );

      case notify:
        return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        );

      case seeAllBestSeller:
        return MaterialPageRoute(
          builder: (context) => const BestSellerScreen(),
        );

      case seeAllRestaurant:
        return MaterialPageRoute(
          builder: (context) => const RestaurantListScreen(),
        );

      case reservationscreen:
        final restaurantId = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => ReservationScreen(restaurantId: restaurantId),
        );

      default:
        return MaterialPageRoute(
          builder:
              (context) => const Scaffold(
                body: Center(child: Text("404 - Page Not Found")),
              ),
        );
    }
  }
}
