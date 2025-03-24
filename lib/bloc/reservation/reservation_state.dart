import 'package:reservation_system/models/class/reservation.dart';
import 'package:reservation_system/models/class/restaurant.dart';

sealed class ReservationState {}

class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationFetchRestaurantSuccess extends ReservationState {
  final Restaurant? restaurantData;

  ReservationFetchRestaurantSuccess(this.restaurantData);
}

class ReservationSaveSuccess extends ReservationState {
  final Reservation reservation;

  ReservationSaveSuccess(this.reservation);
}

class ReservationError extends ReservationState {
  final String message;

  ReservationError(this.message);
}
