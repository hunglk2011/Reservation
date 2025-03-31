import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_event.dart';
import 'package:reservation_system/bloc/happy_deal/happy_deal_state.dart';
import 'package:reservation_system/models/class/happy_deal.dart';
import 'package:reservation_system/presentation/happy_deal/mock_data/happy_deal_data.dart';

import '../../services/reservation_service.dart';

class HappyDealBloc extends Bloc<HappyDealEvent, HappyDealState> {
  HappyDealBloc() : super(HappyDealInitial()) {
    on<FetchHappyDealData>((event, emit) async {
      emit(HappyDealLoading());
      final List<HappyDeal> happyList = await HappyDealData.getMockHappyDeals();
      emit(FetchHappyDealSuccess(happydealList: happyList));
    });

    on<FetchHappyDealDetail>((event, emit) async {
      emit(HappyDealLoading());
      final List<HappyDeal> happyList = await HappyDealData.getMockHappyDeals();
      final happyListId =
          happyList.where((e) => e.id == event.happydealId).first;

      emit(FetchHappyDealDetailSuccess(happyDeal: happyListId));
    });

    on<ReserveHappyDeal>((event, emit) async {
      try {
        emit(HappyDealLoading());
        await Future.delayed(const Duration(seconds: 1));

        final reservation = await ReservationService.createNewReservation(
          reservation: event.reservation,
        );

        if (reservation != null) {
          emit(ReserveHappyDealSuccess(reservation: reservation));
        } else {
          emit(ReserveHappyDealError(error: "Failed to save reservation"));
        }
      } catch (e) {
        emit(ReserveHappyDealError(error: "Error: ${e.toString()}"));
      }
    });
  }
}
