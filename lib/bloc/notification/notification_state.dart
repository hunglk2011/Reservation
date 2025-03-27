import 'package:reservation_system/models/class/notification.dart';

sealed class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class FetchNotificationSuccess extends NotificationState {
  List<NotificationModel> notificationList;
  FetchNotificationSuccess({required this.notificationList});
}

class FetchNotificationFaillure extends NotificationState {
  String message;
  FetchNotificationFaillure({required this.message});
}

class MarkAsReadItemSuccess extends NotificationState {
  NotificationModel notification;
  MarkAsReadItemSuccess({required this.notification});
}

class MarkasReadSuccess extends NotificationState {
  List<NotificationModel> notificationList;
  MarkasReadSuccess({required this.notificationList});
}
