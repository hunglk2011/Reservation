import 'package:flutter/material.dart';

import '../../../component/dialog/ui_dialog.dart';
import '../../../models/class/restaurant.dart';
import '../../../routes/route_named.dart';
import '../../home/home_component/restaurant/restaurant_card.dart';

class RestaurantListBodyNologin extends StatelessWidget {
  final  List<Restaurant>? restaurants;
  const RestaurantListBodyNologin({super.key, this.restaurants});

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
          UiDialog.show(
            context,
            title: "Information",
            content: Text("Please login to use our services"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routenamed.login);
                },
                child: Text("Login"),
              ),
            ],
          );
        },
      );
    },
  );
  }
}