import 'package:reservation_system/main.dart';

sealed class ReservationDetailState {}

class ReservationDetailInitial extends ReservationDetailState {}

class ReservationDetailLoading extends ReservationDetailState {}

class ReservationDetailSuccess extends ReservationDetailState {
  final Reservation? reservationData;
  ReservationDetailSuccess({this.reservationData});
}

class ReservationDetailError extends ReservationDetailState {
  final String message;
  ReservationDetailError({required this.message});
}
