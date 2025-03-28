import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/review_restaurant/review_restaurant_event.dart';
import 'package:reservation_system/bloc/review_restaurant/review_restaurant_state.dart';
import 'package:reservation_system/services/reservation_service.dart';

import '../../models/share_preference/preferences.dart';

class ReviewRestaurantBloc
    extends Bloc<ReviewRestaurantEvent, ReviewRestaurantState> {
  ReviewRestaurantBloc() : super(ReviewRestaurantInitial()) {
    on<FetchReservationRestaurant>((event, emit) async {
      emit(ReviewRestaurantLoading());
      final reservationbyID = await ReservationService.getReservationById(
        event.restaurantId,
      );
      emit(ReviewRestaurantSuccess(reservation: reservationbyID));
    });

    on<FetchReviewRestaurant>((event, emit) async {
      emit(ReviewRestaurantLoading());
      final comments = await AppPreference.getCommentData();
      emit(FetchReviewRestaurantSuccess(comments: comments));
    });
  }
}
