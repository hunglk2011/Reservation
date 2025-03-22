sealed class ReservationDetailEvent {}

class FetchReservationDetail extends ReservationDetailEvent {
  final String reservationId;
  FetchReservationDetail({required this.reservationId});
}
