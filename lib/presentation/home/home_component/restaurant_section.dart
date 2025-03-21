import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/bloC/restaurant_list_bloc/restaurant_list_bloc.dart';
import 'package:reservation_system/bloc/event/restaurant_list_event/restaurant_list_event.dart';
import 'package:reservation_system/bloc/state/restaurant_list_state/restaurant_list_state.dart';
import 'package:reservation_system/component/section/ui_section.dart';
import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/presentation/home/home_component/restaurant_card.dart';
import 'package:reservation_system/routes/route_named.dart';

class RestaurantSection extends StatefulWidget {
  const RestaurantSection({super.key});

  @override
  State<RestaurantSection> createState() => _RestaurantSectionState();
}

class _RestaurantSectionState extends State<RestaurantSection> {
  @override
  void initState() {
    super.initState();
    context.read<RestaurantListBloc>().add(FetchRestaurantList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantListBloc, RestaurantListState>(
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
              Navigator.pushNamed(
                context,
                Routenamed.reservationscreen,
                arguments: restaurants[index].id.toString(),
              );
            },
          ),
      separatorBuilder: (context, index) => Divider(),
      itemCount: 3,
    );
