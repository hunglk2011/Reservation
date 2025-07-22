import 'package:flutter/material.dart';

class ConfirmReservationHeader extends StatelessWidget{
  const ConfirmReservationHeader({super.key});

   @override
    Widget build(BuildContext context) {
      return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Your Reservation",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.close)),
      ],
    );
    }
}