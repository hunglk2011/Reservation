import 'package:flutter/material.dart';

import '../../../models/class/reservation.dart';
import '../../../routes/route_named.dart';
import 'reservation_history_card.dart';

class ReservationHistoryBody extends StatelessWidget {
  final List<Reservation>? reservations;
  const ReservationHistoryBody({super.key, this.reservations});

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
    itemCount: reservations?.length,
    itemBuilder: (context, index) {
      return ReservationHistoryCard(
        reservation: reservations?[index],
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routenamed.reviewRestaurant,
            arguments: {"reservationKey": reservations?[index].id.toString()},
          );
        },
      );
    },
  );
  }
}