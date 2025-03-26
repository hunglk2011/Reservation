import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/notification/notification_event.dart';
import 'package:reservation_system/bloc/notification/notification_state.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';

import '../../models/class/notification.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<FetchNotification>((event, emit) async {
      emit(NotificationLoading());

      final notifications = await AppPreference.getNotificationData();
      if (state is FetchNotificationSuccess) {
        final currentNotifications = List<NotificationModel>.from(
          (state as FetchNotificationSuccess).notificationList,
        );

        currentNotifications.addAll(notifications);

        emit(FetchNotificationSuccess(notificationList: currentNotifications));
      } else {
        emit(FetchNotificationSuccess(notificationList: notifications));
      }
    });
  }
}
