import 'package:flutter/material.dart';
import 'package:reservation_system/component/button/ui_dropdown_button.dart';
import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/presentation/home/home_component/restaurant_card.dart';
import 'package:reservation_system/routes/route_named.dart';
import 'package:reservation_system/services/restaurant_service.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  List<String> categories = ["All", "DESC STARS", "ASC STARS"];
  List<Restaurant> filterRestaurant = [];
  List<Restaurant> restaurants = [];
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    _loadRestaurants();
  }

  void _loadRestaurants() async {
    List<Restaurant> restaurant =
        await RestaurantService.getRestaurantFromServer();
    setState(() {
      restaurants = restaurant;
      filterRestaurant = List.from(restaurants);
    });
  }

  void filterCategories(String category) {
    setState(() {
      selectedCategory = category;
      switch (category) {
        case "DESC STARS":
          return filterRestaurant.sort(
            (a, b) => b.address!.compareTo(a.address!),
          );
        case "ASC STARS":
          return filterRestaurant.sort(
            (a, b) => a.address!.compareTo(b.address!),
          );
        default:
          filterRestaurant = List.from(restaurants);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Our Restaurant",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff483332),
              ),
            ),
            UIDropdownButton(
              itemList: categories,
              value: selectedCategory,
              onChanged: (value) {
                value != null ? filterCategories(value) : "";
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(child: _buildBody(context, filterRestaurant)),
      ),
    );
  }
}

Widget _buildBody(BuildContext context, List<Restaurant> restaurants) {
  return ListView.builder(
    itemCount: restaurants.length,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return RestaurantCard(
        address: restaurants[index].address ?? "",
        nameRestaurant: restaurants[index].nameRestaurant ?? "",
        image: restaurants[index].image,
        onchanged: () {
          Navigator.pushNamed(
            context,
            Routenamed.reservationscreen,
            arguments: restaurants[index].id.toString(),
          );
        },
      );
    },
  );
}
