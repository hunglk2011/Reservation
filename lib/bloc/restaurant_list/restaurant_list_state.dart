import 'package:reservation_system/models/class/restaurant.dart';

sealed class RestaurantListState {}

class RestaurantListInitial extends RestaurantListState {}

class RestaurantListLoading extends RestaurantListState {}

class RestaurantListFetchSuccess extends RestaurantListState {
  final List<Restaurant> restaurants;
  RestaurantListFetchSuccess({required this.restaurants});
}

class RestaurantListFetchFailure extends RestaurantListState {
  final String error;
  RestaurantListFetchFailure({required this.error});
}
