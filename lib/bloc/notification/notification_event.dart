sealed class NotificationEvent {}

class FetchNotification extends NotificationEvent {}

class MarkAsReadItem extends NotificationEvent {
  String reservationId;
  MarkAsReadItem({required this.reservationId});
}

class MarkAsReadAll extends NotificationEvent {}
