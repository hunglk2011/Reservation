import 'package:flutter/material.dart';

class Header extends StatelessWidget {
final String? title;
  const Header({super.key, this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            title.toString(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}