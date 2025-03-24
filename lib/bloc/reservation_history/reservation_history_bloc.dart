import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/reservation_history/reservation_history_event.dart';
import 'package:reservation_system/bloc/reservation_history/reservation_history_state.dart';
import 'package:reservation_system/services/reservation_service.dart';

class ReservationHistoryBloc
    extends Bloc<ReservationHistoryEvent, ReservationHistoryState> {
  ReservationHistoryBloc() : super(ReservationHistoryInitial()) {
    on<FetchReservationHistory>((event, emit) async {
      emit(ReservationHistoryLoading());
      final reservations = await ReservationService.getReservationFromServer();
      emit(ReservationHistorySuccess(reservations));
    });
  }
}
