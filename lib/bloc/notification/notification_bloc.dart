import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/notification/notification_event.dart';
import 'package:reservation_system/bloc/notification/notification_state.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<FetchNotification>((event, emit) async {
      emit(NotificationLoading());

      final notifications = await AppPreference.getNotificationData();

      emit(FetchNotificationSuccess(notificationList: notifications));
    });

    on<MarkAsReadItem>((event, emit) async {
      if (state is FetchNotificationSuccess) {
        final currentState = state as FetchNotificationSuccess;
        final updatedNotifications =
            currentState.notificationList.map((e) {
              return e.id == event.notificationId
                  ? e.copyWith(isRead: true)
                  : e;
            }).toList();

        await AppPreference.updateNotificationData(updatedNotifications);

        emit(FetchNotificationSuccess(notificationList: updatedNotifications));
      }
    });

    on<MarkAsReadAll>((event, emit) async {
      if (state is FetchNotificationSuccess) {
        final currentState = state as FetchNotificationSuccess;
        final updatedNotifications =
            currentState.notificationList.map((e) {
              return e.copyWith(isRead: true);
            }).toList();

        await AppPreference.updateNotificationData(updatedNotifications);

        emit(FetchNotificationSuccess(notificationList: updatedNotifications));
      }
    });
  }
}
