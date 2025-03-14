import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/presentation/home/home_component/restaurant_card.dart';
import 'package:reservation_system/services/restaurant_service.dart';
import 'package:reservation_system/todo_project/bloc/restaurant_bloc.dart';
import 'package:reservation_system/todo_project/bloc/restaurant_state.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          final isLoading = state is RestaurantLoading;
          List<Restaurant> restaurantList = [];
          if (state is RestaurantRefreshedSuccess) {
            restaurantList = state.restaurantServer;
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  _buildBody(context, restaurantList),
                  if (isLoading) Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildBody(BuildContext context, List<Restaurant> restaurant) {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: restaurant.length,
    itemBuilder: (context, index) {
      return RestaurantCard(
        address: restaurant[index].address.toString(),
        nameRestaurant: restaurant[index].nameRestaurant.toString(),
        image: restaurant[index].image,
      );
    },
  );
}
