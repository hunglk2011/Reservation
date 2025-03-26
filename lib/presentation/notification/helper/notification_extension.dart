import 'package:flutter/widgets.dart';

import '../../../models/class/notification.dart';
import '../../../models/class/reservation.dart';

extension NotificationExtension on NotificationModel {
  Widget getNotificationMessage() {
    if (reservation == null) {
      return Text("Your reservation details are missing.");
    }
    String reservationId = reservation!.id ?? id;

    switch (reservation!.status) {
      case ReservationStatus.finished:
        return RichText(
          text: TextSpan(
            text: "Reservation",
            children: [
              TextSpan(
                text: " #$reservationId ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "has been finished successfully. Review Now"),
            ],
          ),
        );

      case ReservationStatus.pending:
        return RichText(
          text: TextSpan(
            text: "Reservation",
            children: [
              TextSpan(
                text: " #$reservationId ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text:
                    "has been booked. Please pay the deposit in time to keep your seats.\n",
              ),
              TextSpan(text: "Total deposit "),
              TextSpan(
                text: "${reservation!.amount} VND",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );

      case ReservationStatus.cancelled:
        return RichText(
          text: TextSpan(
            text: "Reservation",
            children: [
              TextSpan(
                text: " #$reservationId ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "has been cancelled.\n"),
              TextSpan(text: "You will be refunded in 5 days."),
            ],
          ),
        );

      case ReservationStatus.confirmed:
        return RichText(
          text: TextSpan(
            text: "Reservation",
            children: [
              TextSpan(
                text: " #$reservationId ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "has been confirmed. Please go on time!"),
            ],
          ),
        );

      case ReservationStatus.deposited:
        return RichText(
          text: TextSpan(
            text: "Reservation",
            children: [
              TextSpan(
                text: " #$reservationId ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "has been deposited successfully."),
            ],
          ),
        );

      default:
        return Text("Your reservation is pending");
    }
  }
}
