import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/reservation_history/reservation_history_event.dart';
import 'package:reservation_system/bloc/reservation_history/reservation_history_state.dart';

class ReservationHistoryBloc
    extends Bloc<ReservationHistoryEvent, ReservationHistoryState> {
  ReservationHistoryBloc() : super(ReservationHistoryInitial()) {
    on<FetchReservationHistory>((event, emit) async {
      emit(ReservationHistoryLoading());
      //get data from server
      emit(ReservationHistorySuccess([]));
    });
  }
}
