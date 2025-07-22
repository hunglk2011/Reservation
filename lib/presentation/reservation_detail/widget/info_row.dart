import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfoRow extends StatelessWidget {
  IconData? icon;
   String? text;
  InfoRow({super.key, this.icon, this.text} );

  @override
  Widget build(BuildContext context) {
     return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Icon(icon, color: Colors.red),
        SizedBox(width: 8),
        Expanded(child: Text(text!, style: TextStyle(fontSize: 14))),
      ],
    ),
  );
  }
}