sealed class ReviewRestaurantEvent {}

class FetchReservationRestaurant extends ReviewRestaurantEvent {
  final String restaurantId;
  FetchReservationRestaurant({required this.restaurantId});
}

class SubmitReview extends ReviewRestaurantEvent {
  String restaurantId;
  SubmitReview({required this.restaurantId});
}
