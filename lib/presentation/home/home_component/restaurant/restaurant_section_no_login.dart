import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_bloc.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_event.dart';
import 'package:reservation_system/bloc/restaurant_list/restaurant_list_state.dart';
import 'package:reservation_system/component/section/ui_section.dart';
import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/presentation/home/home_component/restaurant/restaurant_card.dart';
import 'package:reservation_system/routes/route_named.dart';

import '../../../../component/dialog/ui_dialog.dart';

class RestaurantSectionNoLogin extends StatefulWidget {
  const RestaurantSectionNoLogin({super.key});

  @override
  State<RestaurantSectionNoLogin> createState() => _RestaurantSectionState();
}

class _RestaurantSectionState extends State<RestaurantSectionNoLogin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantListBloc()..add(FetchRestaurantList()),
      child: BlocBuilder<RestaurantListBloc, RestaurantListState>(
        builder: (context, state) {
          if (state is RestaurantListLoading ||
              state is RestaurantListFetchFailure) {
            return UISection(
              title: "Our Restaurant",
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is RestaurantListFetchSuccess) {
            final List<Restaurant> result = List.from(state.restaurants);
            return UISection(
              title: "Our Restaurant",
              body: _buildBody(context, result),
              onPress: () {
                Navigator.pushNamed(context, Routenamed.seeAllRestaurant);
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

Widget _buildBody(BuildContext context, List<Restaurant> restaurants) =>
    ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder:
          (context, index) => RestaurantCard(
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
          ),
      separatorBuilder: (context, index) => Divider(),
      itemCount: 3,
    );
