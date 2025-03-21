import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/bloC/restaurant_list_bloc/restaurant_list_bloc.dart';
import 'package:reservation_system/bloc/event/restaurant_list_event/restaurant_list_event.dart';
import 'package:reservation_system/bloc/state/restaurant_list_state/restaurant_list_state.dart';
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
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RestaurantListBloc>(context).add(FetchRestaurantList());
  }

  void filterCategories(String category, List<Restaurant> restaurants) {
    setState(() {
      selectedCategory = category;
      switch (category) {
        case "DESC STARS":
          filterRestaurant = List.from(restaurants)
            ..sort((a, b) => b.address!.compareTo(a.address!));
          break;
        case "ASC STARS":
          filterRestaurant = List.from(restaurants)
            ..sort((a, b) => a.address!.compareTo(b.address!));
          break;
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
                value != null ? filterCategories(value, filterRestaurant) : "";
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<RestaurantListBloc, RestaurantListState>(
        builder: (context, state) {
          if (state is RestaurantListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RestaurantListFetchFailure) {
            return Center(child: Text("Error: ${state.error}"));
          } else if (state is RestaurantListFetchSuccess) {
            filterRestaurant = List.from(state.restaurants);
            return SingleChildScrollView(
              child: SafeArea(child: _buildBody(context, filterRestaurant)),
            );
          }
          return const Center(child: Text("No data available"));
        },
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
