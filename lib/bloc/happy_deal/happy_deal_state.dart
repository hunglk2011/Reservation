import 'package:reservation_system/models/class/happy_deal.dart';

sealed class HappyDealState {}

class HappyDealInitial extends HappyDealState {}

class HappyDealLoading extends HappyDealState {}

class FetchHappyDealSuccess extends HappyDealState {
  List<HappyDeal> happydealList;
  FetchHappyDealSuccess({required this.happydealList});
}

class FetchHappyDealDetailSuccess extends HappyDealState {
  final HappyDeal happyDeal;
  FetchHappyDealDetailSuccess({required this.happyDeal});
}

class ReserveHappyDealSuccess extends HappyDealState {
  final HappyDeal happyDeal;
  ReserveHappyDealSuccess({required this.happyDeal});
}
