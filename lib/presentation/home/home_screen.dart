import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/presentation/home/home_component/best_seller/best_seller_section.dart';
import 'package:reservation_system/presentation/home/home_component/best_seller/best_seller_section_not_login.dart';
import 'package:reservation_system/presentation/home/home_component/discount_section.dart';
import 'package:reservation_system/presentation/home/home_component/drawer.dart';
import 'package:reservation_system/presentation/home/home_component/restaurant/restaurant_section.dart';
import 'package:reservation_system/presentation/home/home_component/restaurant/restaurant_section_no_login.dart';
import 'package:reservation_system/presentation/home/home_component/slide_show.dart';
import 'package:reservation_system/routes/route_named.dart';

class HomeScreen extends StatefulWidget {
  final String? name;
  final String? email;
  const HomeScreen({super.key, this.name, this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6EFE8),
      drawer: DrawerMenu(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routenamed.notify);
            },
            icon: Icon(Icons.notifications_active),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.place, color: Colors.deepOrangeAccent),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                "Dong Khoi st, District 1",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  UITextInput(
                    hintText: "Search",
                    type: "text",
                    controller: textController,
                  ),
                  state is AuththenticateSuccess
                      ? _BodyLoggedin()
                      : _BodyNoLoggedin(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BodyLoggedin extends StatelessWidget {
  const _BodyLoggedin();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SlideShow(),
            SizedBox(height: 24),
            BestSellerSection(),
            SizedBox(height: 12),
            RestaurantSection(),
            DiscountSection(),
          ],
        ),
      ),
    );
  }
}

class _BodyNoLoggedin extends StatelessWidget {
  const _BodyNoLoggedin();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SlideShow(),
            SizedBox(height: 24),
            BestSellerSectionNotLogin(),
            SizedBox(height: 12),
            RestaurantSectionNoLogin(),
            DiscountSection(),
          ],
        ),
      ),
    );
  }
}
