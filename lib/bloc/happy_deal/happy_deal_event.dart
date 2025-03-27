import 'package:reservation_system/models/class/happy_deal.dart';

sealed class HappyDealEvent {}

class FetchHappyDealData extends HappyDealEvent {}

class FetchHappyDealDetail extends HappyDealEvent {
  String? happydealId;
  FetchHappyDealDetail({this.happydealId});
}

class ReserveHappyDeal extends HappyDealEvent {
  HappyDeal happyDeal;
  ReserveHappyDeal({required this.happyDeal});
}
