import 'package:reservation_system/main.dart';

sealed class ReservationHistoryState {}

class ReservationHistoryInitial extends ReservationHistoryState {}

class ReservationHistoryLoading extends ReservationHistoryState {}

class ReservationHistorySuccess extends ReservationHistoryState {
  final List<Reservation> reservationList;

  ReservationHistorySuccess(this.reservationList);
}

class ReservationHistoryFailure extends ReservationHistoryState {
  final String errorMessage;

  ReservationHistoryFailure(this.errorMessage);
}
