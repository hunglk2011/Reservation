import 'package:flutter/material.dart';
import 'package:reservation_system/component/section/ui_section.dart';
import 'package:reservation_system/presentation/home/data/home_data.dart';
import 'package:reservation_system/presentation/home/home_component/restaurant_card.dart';
import 'package:reservation_system/routes/route_named.dart';

class RestaurantSection extends StatelessWidget {
  const RestaurantSection({super.key});

  @override
  Widget build(BuildContext context) {
    return UISection(
      title: "Our Restaurant",
      body: _buildBody(context),
      onPress: () {
        Navigator.pushNamed(context, Routenamed.seeAllRestaurant);
      },
    );
  }
}

Widget _buildBody(BuildContext context) => ListView.separated(
  physics: NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  itemBuilder:
      (context, index) => RestaurantCard(
        address: HomePageData.restaurant[index].address ?? "",
        nameRestaurant: HomePageData.restaurant[index].nameRestaurant ?? "",
        image: HomePageData.restaurant[index].image,
      ),
  separatorBuilder: (context, index) => Divider(),
  itemCount: 3,
);
