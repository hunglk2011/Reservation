import '../../models/class/reservation.dart';

sealed class HappyDealEvent {}

class FetchHappyDealData extends HappyDealEvent {}

class FetchHappyDealDetail extends HappyDealEvent {
  String? happydealId;
  FetchHappyDealDetail({this.happydealId});
}

class ReserveHappyDeal extends HappyDealEvent {
  final Reservation reservation;
  ReserveHappyDeal({required this.reservation});
}
