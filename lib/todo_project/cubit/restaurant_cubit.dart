import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/services/restaurant_service.dart';
import 'package:reservation_system/todo_project/cubit/restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(RestaurantInit());

  void refreshRestaurant() async {
    emit(RestaurantLoading());
    List<Restaurant> restaurants =
        await RestaurantService.getRestaurantFromServer();
    emit(RestaurantRefreshedSuccess(restaurantServer: restaurants));
  }
}
