import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_bloc.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_event.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_state.dart';
import 'package:reservation_system/component/button/ui_dropdown_button.dart';
import 'package:reservation_system/component/loading/ui_shimmer.dart';
import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/presentation/home/home_component/restaurant/restaurant_card.dart';
import 'package:reservation_system/routes/route_named.dart';

import '../../component/dialog/ui_dialog.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  List<String> categories = ["All", "A-Z", "Z-A"];
  List<Restaurant> filterRestaurant = [];
  String selectedCategory = "All";

  void filterCategories(String category, List<Restaurant> restaurants) {
    setState(() {
      selectedCategory = category;
      switch (category) {
        case "A-Z":
          filterRestaurant = List.from(restaurants)
            ..sort((a, b) => a.nameRestaurant!.compareTo(b.nameRestaurant!));
          break;
        case "Z-A":
          filterRestaurant = List.from(restaurants)
            ..sort((a, b) => b.nameRestaurant!.compareTo(a.nameRestaurant!));
          break;
        default:
          filterRestaurant = List.from(restaurants);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantListBloc()..add(FetchRestaurantList()),
      child: Scaffold(
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
              BlocBuilder<RestaurantListBloc, RestaurantListState>(
                builder: (context, state) {
                  return UIDropdownButton(
                    itemList: categories,
                    value: selectedCategory,
                    onChanged: (value) {
                      if (value != null &&
                          state is RestaurantListFetchSuccess) {
                        filterCategories(value, state.restaurants);
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return BlocBuilder<RestaurantListBloc, RestaurantListState>(
              builder: (context, state) {
                if (state is RestaurantListLoading) {
                  return UiShimmer();
                } else if (state is RestaurantListFetchFailure) {
                  return Center(child: Text("Error: ${state.error}"));
                } else if (state is RestaurantListFetchSuccess) {
                  return SingleChildScrollView(
                    child: SafeArea(
                      child:
                          state is AuththenticateSuccess
                              ? _buildBody(
                                context,
                                filterRestaurant.isNotEmpty
                                    ? filterRestaurant
                                    : state.restaurants,
                              )
                              : _buildBodyNoLoggedin(
                                context,
                                filterRestaurant.isNotEmpty
                                    ? filterRestaurant
                                    : state.restaurants,
                              ),
                    ),
                  );
                }
                return const Center(child: Text("No data available"));
              },
            );
          },
        ),
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

Widget _buildBodyNoLoggedin(
  BuildContext context,
  List<Restaurant> restaurants,
) {
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
