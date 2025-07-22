import 'package:flutter/material.dart';
import 'package:reservation_system/models/class/reservation.dart';
import 'package:reservation_system/presentation/confirm_reservation/widget/confirm_reservation_InfoRow.dart';

class ConfirmReservationInfo extends StatelessWidget {
  final String? restaurantName;
  final Reservation? reservation;

  const ConfirmReservationInfo({super.key, this.restaurantName, this.reservation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xffF6EFE8),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Column(
          children: [
            ConfirmReservationInforow(icon: Icons.location_on, title: restaurantName ?? ""),

            ConfirmReservationInforow(icon: Icons.calendar_today, title: 
             reservation!.reservationDate != null
                  ? "${reservation!.reservationDate!.day}/${reservation!.reservationDate!.month}/${reservation!.reservationDate!.year}"
                  : DateTime.now().toString(),
            ),

            ConfirmReservationInforow(icon: Icons.access_time, title: reservation!.reservationTime != null ? 
            reservation!.reservationTime! : TimeOfDay.now().toString()),

            ConfirmReservationInforow(
              icon: Icons.people,
              title: reservation!.numberPeople.toString(),
            ),
            ConfirmReservationInforow(icon: Icons.note, title: reservation!.notes.toString()),
          ],
        ),
      ),
    );
  }
}