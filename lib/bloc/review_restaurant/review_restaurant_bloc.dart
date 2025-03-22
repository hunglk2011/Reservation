import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/review_restaurant/review_restaurant_event.dart';
import 'package:reservation_system/bloc/review_restaurant/review_restaurant_state.dart';

class ReviewRestaurantBloc
    extends Bloc<ReviewRestaurantEvent, ReviewRestaurantState> {
  ReviewRestaurantBloc() : super(ReviewRestaurantInitial()) {
    on<FetchReservationRestaurant>((event, emit) {
      emit(ReviewRestaurantLoading());
      // Fetch data from API
      emit(ReviewRestaurantSuccess(restaurantId: event.restaurantId));
    });

    on<SubmitReview>((event, emit) {
      emit(ReviewRestaurantLoading());
      // Submit review to API
      emit(SubmitReviewSuccess());
    });
  }
}
