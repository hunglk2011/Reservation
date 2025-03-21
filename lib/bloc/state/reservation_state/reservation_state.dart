import 'package:reservation_system/models/class/restaurant.dart';

sealed class ReservationState {}

class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationFetchRestaurantSuccess extends ReservationState {
  final Restaurant? restaurantData;

  ReservationFetchRestaurantSuccess(this.restaurantData);
}
