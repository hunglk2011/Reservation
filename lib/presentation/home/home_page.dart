import 'package:first_app/Widget/menu/drawer.dart';
import 'package:first_app/Widget/section/section_discount.dart';
import 'package:first_app/Widget/section/section_product.dart';
import 'package:first_app/Widget/section/section_restaurant.dart';
import 'package:first_app/Widget/slide_show.dart';
import 'package:first_app/Widget/text_input.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? name;
  final String? email;
  const HomePage({super.key, this.name, this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6EFE8),
      drawer: DrawerMenu(
        userName: widget.name,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DrawerButton(),
                    Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: Colors.deepOrangeAccent,
                        ),
                        Text("Dong Khoi st, District 1"),
                      ],
                    ),
                    Icon(
                      Icons.notifications_active,
                    )
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Column(
                  children: [
                    TextInput(
                      hintText: "Search",
                      type: "text",
                      controller: textController,
                    ),
                    SlideShow(),
                    SizedBox(
                      height: 24,
                    ),
                    SectionList(title: "BEST SELLER"),
                    SizedBox(
                      height: 12,
                    ),
                    SectionRestaurant(title: "OUR RESTAURANT"),
                    SectionDiscount(title: "HAPPY DEALS")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
