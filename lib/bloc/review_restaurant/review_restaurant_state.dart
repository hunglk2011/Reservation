sealed class ReviewRestaurantState {}

class ReviewRestaurantInitial extends ReviewRestaurantState {}

class ReviewRestaurantLoading extends ReviewRestaurantState {}

class ReviewRestaurantSuccess extends ReviewRestaurantState {
  final String restaurantId;
  ReviewRestaurantSuccess({required this.restaurantId});
}

class SubmitReviewSuccess extends ReviewRestaurantState {}
