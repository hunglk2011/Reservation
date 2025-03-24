import 'package:reservation_system/models/class/reservation.dart';

sealed class ReservationEvent {}

class ReservationFetchRestaurantByID extends ReservationEvent {
  final String id;
  ReservationFetchRestaurantByID({required this.id});
}

class ReservationSaveToServer extends ReservationEvent {
  final Reservation reservation;
  ReservationSaveToServer({required this.reservation});
}
