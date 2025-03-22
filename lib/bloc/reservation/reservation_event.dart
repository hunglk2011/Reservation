sealed class ReservationEvent {}

class ReservationFetchRestaurantByID extends ReservationEvent {
  final String id;
  ReservationFetchRestaurantByID({required this.id});
}
