sealed class ReviewRestaurantEvent {}

class FetchReservationRestaurant extends ReviewRestaurantEvent {
  final String restaurantId;
  FetchReservationRestaurant({required this.restaurantId});
}

class FetchReviewRestaurant extends ReviewRestaurantEvent {}
