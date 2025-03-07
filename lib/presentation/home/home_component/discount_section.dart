import 'package:flutter/material.dart';
import 'package:reservation_system/component/section/ui_section.dart';
import 'package:reservation_system/presentation/home/home_component/happy_meal_card.dart';

class DiscountSection extends StatelessWidget {
  const DiscountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return UISection(title: "Happy Deals", body: _buildBody(context));
  }
}

Widget _buildBody(BuildContext context) => SizedBox(
  height: 200,
  child: ListView.separated(
    itemCount: 1,
    scrollDirection: Axis.horizontal,
    physics: BouncingScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) => DiscountCard(),
    separatorBuilder: (context, index) => Divider(),
  ),
);
