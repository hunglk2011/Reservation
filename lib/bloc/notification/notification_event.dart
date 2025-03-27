sealed class NotificationEvent {}

class FetchNotification extends NotificationEvent {}

class MarkAsReadItem extends NotificationEvent {
  String notificationId;
  MarkAsReadItem({required this.notificationId});
}

class MarkAsReadAll extends NotificationEvent {}
