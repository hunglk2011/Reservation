// ignore: file_names
import 'package:flutter/material.dart';

class ConfirmReservationInforow extends StatelessWidget {
  final IconData icon;
  final String title;
  const ConfirmReservationInforow({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.red),
          SizedBox(width: 8),
          Expanded(child: Text(title, style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}