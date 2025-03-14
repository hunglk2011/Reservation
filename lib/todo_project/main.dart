import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/presentation/home/home_component/restaurant_card.dart';
import 'package:reservation_system/services/restaurant_service.dart';
import 'package:reservation_system/todo_project/bloc/restaurant_bloc.dart';
import 'package:reservation_system/todo_project/bloc/restaurant_state.dart';

import 'bloc/restaurant_even.dart';

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
              child: Column(
                children: [
                  _buildBody(context, restaurantList),
                  if (isLoading) CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddRestaurantDialog(context),
        child: Icon(Icons.add),
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

Future<void> _showAddRestaurantDialog(BuildContext context) async {
  String name = '';
  String address = '';
  String image = '';

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Add new Restaurant'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "name"),
              onChanged: (value) => name = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: "address"),
              onChanged: (value) => address = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: "link"),
              onChanged: (value) => image = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (name.isNotEmpty && address.isNotEmpty && image.isNotEmpty) {
                context.read<RestaurantBloc>().add(
                  RestaurantCreate(
                    nameRestaurant: name,
                    address: address,
                    image: image,
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            child: Text('add'),
          ),
        ],
      );
    },
  );
}
