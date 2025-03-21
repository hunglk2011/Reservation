import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/event/reservation_event/reservation_event.dart';
import 'package:reservation_system/bloc/state/reservation_state/reservation_state.dart';
import 'package:reservation_system/services/restaurant_service.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<ReservationFetchRestaurantByID>((event, emit) async {
      emit(ReservationLoading());
      await Future.delayed(const Duration(seconds: 1));
      final restaurantData = await RestaurantService.getRestaurantById(
        id: event.id,
      );
      emit(ReservationFetchRestaurantSuccess(restaurantData));
    });
  }
}
