import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/reservation_detail/reservation_detail_event.dart';
import 'package:reservation_system/bloc/reservation_detail/reservation_detail_state.dart';

class ReservationDetailBloc
    extends Bloc<ReservationDetailEvent, ReservationDetailState> {
  ReservationDetailBloc() : super(ReservationDetailInitial()) {
    on<FetchReservationDetail>((event, emit) async {
      emit(ReservationDetailLoading());
      // Fetch data from API
      emit(ReservationDetailSuccess());
    });
  }
}
