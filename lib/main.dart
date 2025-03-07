import 'package:flutter/material.dart';
import 'package:reservation_system/routes/route_named.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      initialRoute: Routenamed.splash,
      onGenerateRoute: Routenamed.generateRouted,
      debugShowCheckedModeBanner: false,
    ),
  );
}
