import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_event.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_state.dart';
import 'package:reservation_system/models/class/happy_deal.dart';

class HappyDealBloc extends Bloc<HappyDealEvent, HappyDealState> {
  HappyDealBloc() : super(HappyDealInitial()) {
    on<FetchHappyDealData>((event, emit) {
      emit(HappyDealLoading());
      final List<HappyDeal> happyList = [];

      emit(FetchHappyDealSuccess(happydealList: happyList));
    });

    on<FetchHappyDealDetail>((event, emit) {
      emit(HappyDealLoading());
      final List<HappyDeal> happyList = [];

      emit(FetchHappyDealSuccess(happydealList: happyList));
    });

    on<ReserveHappyDeal>((event, emit) {
      emit(HappyDealLoading());
      HappyDeal happyDeal = HappyDeal();

      emit(ReserveHappyDealSuccess(happyDeal: happyDeal));
    });
  }
}
