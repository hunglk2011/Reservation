import 'package:flutter/material.dart';
import 'package:reservation_system/component/ui_section/section.dart';
import 'package:reservation_system/presentation/home/data/home_data.dart';
import 'package:reservation_system/presentation/home/home_component/restaurant_card.dart';

class RestaurantSection extends StatelessWidget {
  const RestaurantSection({super.key});

  @override
  Widget build(BuildContext context) {
    return UISection(title: "Our Restaurant", body: _buildBody(context));
  }
}

Widget _buildBody(BuildContext context) => ListView.separated(
  physics: NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  itemBuilder:
      (context, index) => RestaurantCard(
        address: HomePageData.restaurant[index].address ?? "",
        nameRestaurant: HomePageData.restaurant[index].nameRestaurant ?? "",
      ),
  separatorBuilder: (context, index) => Divider(),
  itemCount: 3,
);
