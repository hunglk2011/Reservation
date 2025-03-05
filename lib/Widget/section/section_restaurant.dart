import 'package:first_app/Widget/restaurant_card.dart';
import 'package:first_app/presentation/home/home_page_data.dart';
import 'package:flutter/material.dart';

class SectionRestaurant extends StatelessWidget {
  final String title;
  const SectionRestaurant({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff483332)),
            ),
            Text(
              "See All",
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff999999),
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        Column(
          children: HomePageData.restaurant.map((restaurant) {
            return Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: RestaurantCard(
                address: restaurant.address ?? "",
                nameRestaurant: restaurant.nameRestaurant ?? "",
                image: restaurant.image,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
