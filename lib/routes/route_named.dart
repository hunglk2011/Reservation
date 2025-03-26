import 'package:flutter/material.dart';
import 'package:reservation_system/models/class/reservation.dart';
import 'package:reservation_system/presentation/change_password/change_password.dart';
import 'package:reservation_system/presentation/confirm_reservation/confirm_reservation.dart';
import 'package:reservation_system/presentation/confirm_reservation/reservation_payment.dart';
import 'package:reservation_system/presentation/forgot_password/forgot_password_screen.dart';
import 'package:reservation_system/presentation/home/home_screen.dart';
import 'package:reservation_system/presentation/login/login_screen.dart';
import 'package:reservation_system/presentation/notification/notification_screen.dart';
import 'package:reservation_system/presentation/onboard/onboard_screen.dart';
import 'package:reservation_system/presentation/profile/edit_profile.dart';
import 'package:reservation_system/presentation/reservation/reservation_screen.dart';
import 'package:reservation_system/presentation/reservation_detail/reservation_detail_screen.dart';
import 'package:reservation_system/presentation/reservation_history/reservation_history_screen.dart';
import 'package:reservation_system/presentation/reset_password/reset_pass_screen.dart';
import 'package:reservation_system/presentation/restaurant/restaurant_list.dart';
import 'package:reservation_system/presentation/review_restaurant/review_restaurant_screen.dart';
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
  static const String confirmReservation = "/confirmReservation";
  static const String payment = "/payment";
  static const String profilescreen = "/profile";
  static const String changepass = "/changePass";
  static const String reservationHistory = "/reservationHistory";
  static const String reservationDetail = "/reservationDetail";
  static const String reviewRestaurant = "/reviewRestaurant";

  static Route<dynamic>? generateRouted(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case onboard:
        return MaterialPageRoute(builder: (context) => const OnboardScreen());

      case login:
        return MaterialPageRoute(builder: (context) => LoginScreen());

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

      case confirmReservation:
        final data = settings.arguments as Map<String, dynamic>;
        final reservationData = Reservation.fromJson(
          data["reservation"] as Map<String, dynamic>,
        );
        return MaterialPageRoute(
          builder:
              (context) => ConfirmReservation(reservation: reservationData),
        );

      case reservationHistory:
        return MaterialPageRoute(
          builder: (context) => const ReservationHistory(),
        );

      case reviewRestaurant:
        final data = settings.arguments as Map<String, dynamic>;
        final reservationId = data["reservationKey"] as String;
        return MaterialPageRoute(
          builder: (context) => ReviewRestaurantScreen(id: reservationId),
        );

      case reservationDetail:
        final data = settings.arguments as Map<String, dynamic>;
        final reservationId = data["reservationId"] as String;
        return MaterialPageRoute(
          builder:
              (context) =>
                  ReservationDetailScreen(reservationId: reservationId),
        );

      case payment:
        return MaterialPageRoute(builder: (context) => ReservationPayment());

      case profilescreen:
        return MaterialPageRoute(builder: (context) => EditProfile());

      case changepass:
        return MaterialPageRoute(builder: (context) => ChangePassword());

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
