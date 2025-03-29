import 'package:flutter/material.dart';
import 'package:reservation_system/component/section/ui_section.dart';
import 'package:reservation_system/presentation/home/home_component/happy_meal_card.dart';

import '../../../routes/route_named.dart';

class DiscountSection extends StatelessWidget {
  const DiscountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return UISection(
      title: "Happy Deals",
      body: _buildBody(context),
      onPress: () {
        Navigator.pushNamed(context, Routenamed.happydeal);
      },
    );
  }
}

Widget _buildBody(BuildContext context) => SizedBox(
  height: 120,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.separated(
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => DiscountCard(),
      separatorBuilder: (context, index) => SizedBox(width: 10),
    ),
  ),
);
