import 'package:flutter/material.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';
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
