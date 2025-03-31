import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/presentation/home/home_component/best_seller/best_seller_section.dart';
import 'package:reservation_system/presentation/home/home_component/best_seller/best_seller_section_not_login.dart';
import 'package:reservation_system/presentation/home/home_component/discount/discount_section.dart';
import 'package:reservation_system/presentation/home/home_component/discount/discount_section_no_login.dart';
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
        backgroundColor: Color(0xffF6EFE8),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routenamed.notify);
            },
            icon: Icon(Icons.notifications_on_rounded),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.place, color: Color(0xffAD3F32), size: 23),
            SizedBox(width: 4),
            Text(
              "Dong Khoi st, District 1",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UITextInput(
                    hintText: "Search",
                    type: "text",
                    controller: textController,
                  ),
                ),
                Expanded(
                  child:
                      state is AuththenticateSuccess
                          ? _BodyLoggedin()
                          : _BodyNoLoggedin(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BodyLoggedin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SlideShow(),
          SizedBox(height: 20),
          BestSellerSection(),
          SizedBox(height: 20),
          RestaurantSection(),
          DiscountSection(),
        ],
      ),
    );
  }
}

class _BodyNoLoggedin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SlideShow(),
          SizedBox(height: 20),
          SizedBox(height: 300, child: BestSellerSectionNotLogin()),
          SizedBox(height: 20),
          RestaurantSectionNoLogin(),
          DiscountSectionNoLogin(),
        ],
      ),
    );
  }
}
