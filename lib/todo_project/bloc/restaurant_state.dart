import 'package:reservation_system/models/class/restaurant.dart';

sealed class RestaurantState {}

final class RestaurantInit extends RestaurantState {}

final class RestaurantRefreshedSuccess extends RestaurantState {
  final List<Restaurant> restaurantServer;
  RestaurantRefreshedSuccess({required this.restaurantServer});
}

final class RestaurantLoading extends RestaurantState {}
