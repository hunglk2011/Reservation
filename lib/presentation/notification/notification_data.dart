import 'package:reservation_system/models/class/notification.dart';
import 'package:reservation_system/models/class/reservation.dart';

class NotificationData {
  static List<NotificationModel> data = [
    NotificationModel(
      reservation: Reservation(
        status: ReservationStatus.pending,
        id: '23657865346',
        amount: 690000,
      ),
    ),
    NotificationModel(
      reservation: Reservation(
        status: ReservationStatus.finished,
        id: '111111111',
        amount: 318516734816847,
      ),
    ),
  ];
}
