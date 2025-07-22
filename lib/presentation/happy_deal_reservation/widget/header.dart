import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String? title;
  const Header({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF8960), Color(0xFFFF62A5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.white, size: 28),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}