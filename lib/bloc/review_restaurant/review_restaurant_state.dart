import 'package:reservation_system/models/class/reservation.dart';
import 'package:reservation_system/models/class/restaurant.dart';

sealed class ReviewRestaurantState {}

class ReviewRestaurantInitial extends ReviewRestaurantState {}

class ReviewRestaurantLoading extends ReviewRestaurantState {}

class ReviewRestaurantSuccess extends ReviewRestaurantState {
  final Reservation? reservation;
  ReviewRestaurantSuccess({required this.reservation});
}

class SubmitReviewSuccess extends ReviewRestaurantState {
  final Restaurant? restaurant;
  SubmitReviewSuccess({required this.restaurant});
}
