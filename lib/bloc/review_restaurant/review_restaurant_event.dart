sealed class ReviewRestaurantEvent {}

class FetchReservationRestaurant extends ReviewRestaurantEvent {
  final String restaurantId;
  FetchReservationRestaurant({required this.restaurantId});
}

class SubmitReview extends ReviewRestaurantEvent {
  final String restaurantId;
  final String review;
  final double rating;
  SubmitReview({
    required this.restaurantId,
    required this.review,
    required this.rating,
  });
}
