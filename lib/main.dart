import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';
import 'package:reservation_system/presentation/reservation/reservation_screen.dart';
import 'package:reservation_system/presentation/restaurant/restaurant_list.dart';
import 'package:reservation_system/presentation/see_all/best_seller/best_seller_screen.dart';
import 'package:reservation_system/routes/route_named.dart';
import 'package:reservation_system/todo_project/bloc/restaurant_bloc.dart';
import 'package:reservation_system/todo_project/main.dart';

import 'todo_project/bloc/restaurant_even.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantBloc()..add(RestaurantRefresh()),
      child: MaterialApp(home: TodoScreen(), debugShowCheckedModeBanner: false),
    );
  }
}
