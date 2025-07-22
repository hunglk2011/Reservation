import 'package:flutter/material.dart';

import '../../../models/class/reservation.dart';
import 'info_row.dart';

class ReservationInfo extends StatelessWidget {
   final Reservation? reservationData;
  const ReservationInfo({super.key, this.reservationData});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          InfoRow(
           icon:  Icons.location_on,
            // widget.reservation!.restaurantInfo?.address ?? "",
           text: reservationData?.restaurantId ?? "Unknown Restaurant",
          ),
          InfoRow(
           icon: Icons.calendar_today,
           text: reservationData?.reservationDate != null
                ? "${reservationData?.reservationDate!.day}/${reservationData?.reservationDate!.month}/${reservationData?.reservationDate!.year}"
                : DateTime.now().toString(),
          ),

          InfoRow(
           icon: Icons.access_time,
           text: reservationData?.reservationTime != null
                ? reservationData?.reservationTime!
                : TimeOfDay.now().toString(),
          ),
          InfoRow(icon:Icons.people, text: reservationData?.numberPeople.toString()),

         InfoRow(icon: Icons.note, text: reservationData?.notes.toString()),
        ],
      ),
    ),
  );
  }
}