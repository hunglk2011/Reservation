import 'package:reservation_system/models/class/comment.dart';
import 'package:reservation_system/models/class/reservation.dart';

sealed class ReviewRestaurantState {}

class ReviewRestaurantInitial extends ReviewRestaurantState {}

class ReviewRestaurantLoading extends ReviewRestaurantState {}

class ReviewRestaurantSuccess extends ReviewRestaurantState {
  final Reservation? reservation;
  ReviewRestaurantSuccess({required this.reservation});
}

class FetchReviewRestaurantSuccess extends ReviewRestaurantState {
  List<Comment> comments;
  FetchReviewRestaurantSuccess({required this.comments});
}
