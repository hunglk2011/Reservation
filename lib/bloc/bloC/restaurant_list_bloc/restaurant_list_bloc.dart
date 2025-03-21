import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/event/restaurant_list_event/restaurant_list_event.dart';
import 'package:reservation_system/bloc/state/restaurant_list_state/restaurant_list_state.dart';
import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/services/restaurant_service.dart';

class RestaurantListBloc
    extends Bloc<RestaurantListEvent, RestaurantListState> {
  RestaurantListBloc() : super(RestaurantListInitial()) {
    on<FetchRestaurantList>((event, emit) async {
      emit(RestaurantListLoading());
      try {
        final List<Restaurant> restaurants =
            await RestaurantService.getRestaurantFromServer();
        emit(RestaurantListFetchSuccess(restaurants: restaurants));
      } catch (error) {
        emit(RestaurantListFetchFailure(error: error.toString()));
      }
    });
  }
}
