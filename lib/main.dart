import 'package:flutter/material.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';
import 'package:reservation_system/presentation/reservation/reservation_screen.dart';
import 'package:reservation_system/presentation/restaurant/restaurant_list.dart';
import 'package:reservation_system/presentation/see_all/best_seller/best_seller_screen.dart';
import 'package:reservation_system/routes/route_named.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppPreference.init;
  runApp(
    MaterialApp(
      initialRoute: Routenamed.splash,
      onGenerateRoute: Routenamed.generateRouted,
      debugShowCheckedModeBanner: false,
    ),
  );
}
