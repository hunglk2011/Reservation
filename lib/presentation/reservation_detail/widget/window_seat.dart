import 'package:flutter/material.dart';

class WindowSeat extends StatelessWidget {
  const WindowSeat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.edit, color: Colors.red),
          SizedBox(width: 12),
          Text("Window seat", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
  }
}