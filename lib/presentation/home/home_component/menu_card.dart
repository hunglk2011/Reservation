import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String name;
  final Icon iconName;
  final VoidCallback onPressed;

  const MenuCard({
    super.key,
    required this.name,
    required this.iconName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 240,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xffF6EFE8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            iconName,
            SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffA93528),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
