import 'package:flutter/material.dart';

import '../../../models/class/restaurant.dart';
import '../../../routes/route_named.dart';
import '../../home/home_component/restaurant/restaurant_card.dart';

class RestaurantListBodyLoggedin extends StatelessWidget {
  final List<Restaurant>? restaurants;
  const RestaurantListBodyLoggedin({super.key, this.restaurants});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: restaurants?.length,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return RestaurantCard(
        address: restaurants?[index].address ?? "",
        nameRestaurant: restaurants?[index].nameRestaurant ?? "",
        image: restaurants?[index].image,
        onchanged: () {
          Navigator.pushNamed(
            context,
            Routenamed.reservationscreen,
            arguments: restaurants?[index].id.toString(),
          );
        },
      );
    },
  );
  }
}