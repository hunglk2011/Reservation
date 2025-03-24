import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/reservation/reservation_bloc.dart';
import 'package:reservation_system/bloc/reservation_detail/reservation_detail_bloc.dart';
import 'package:reservation_system/bloc/reservation_history/reservation_history_bloc.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_bloc.dart';
import 'package:reservation_system/bloc/review_restaurant/review_restaurant_bloc.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';
import 'package:reservation_system/routes/route_named.dart';
import 'package:reservation_system/todo_project/bloc/restaurant_bloc.dart';
import 'package:reservation_system/todo_project/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.init();
  runApp(ReservationApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantBloc(),
      child: MaterialApp(home: TodoScreen(), debugShowCheckedModeBanner: false),
    );
  }
}

class ReservationApp extends StatelessWidget {
  const ReservationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
        BlocProvider(create: (context) => RestaurantListBloc()),
        BlocProvider(create: (context) => ReservationBloc()),
        BlocProvider(create: (context) => ReservationHistoryBloc()),
        BlocProvider(create: (context) => ReviewRestaurantBloc()),
        BlocProvider(create: (context) => ReservationDetailBloc()),
      ],
      child: MaterialApp(
        initialRoute: Routenamed.splash,
        // home: ReservationDetailScreen(),
        onGenerateRoute: Routenamed.generateRouted,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
