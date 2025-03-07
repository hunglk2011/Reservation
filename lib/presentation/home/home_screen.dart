import 'package:flutter/material.dart';
import 'package:reservation_system/component/textinput/ui_text_input.dart';
import 'package:reservation_system/presentation/home/home_component/best_seller_section.dart';
import 'package:reservation_system/presentation/home/home_component/discount_section.dart';
import 'package:reservation_system/presentation/home/home_component/drawer.dart';
import 'package:reservation_system/presentation/home/home_component/restaurant_section.dart';
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
      drawer: DrawerMenu(userName: widget.name),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              UITextInput(
                hintText: "Search",
                type: "text",
                controller: textController,
              ),
              Expanded(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
