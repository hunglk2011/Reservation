import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/reservation/reservation_event.dart';
import 'package:reservation_system/bloc/reservation/reservation_state.dart';
import 'package:reservation_system/services/reservation_service.dart';
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

    on<ReservationSaveToServer>((event, emit) async {
      try {
        emit(ReservationLoading());
        await Future.delayed(const Duration(seconds: 1));

        final reservation = await ReservationService.createNewReservation(
          reservation: event.reservation,
        );

        if (reservation != null) {
          emit(ReservationSaveSuccess(reservation));
        } else {
          emit(ReservationError("Failed to save reservation"));
        }
      } catch (e) {
        emit(ReservationError("Error: ${e.toString()}"));
      }
    });
  }
}
