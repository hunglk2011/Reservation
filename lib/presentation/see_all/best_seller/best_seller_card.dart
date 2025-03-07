import 'package:flutter/material.dart';
import 'package:reservation_system/component/ui_button/reserve_button.dart';

class BestSellerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback? onPressed;

  const BestSellerCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Colors.black54,
                  ),
                ),
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) =>
                          const Icon(Icons.star, color: Colors.red, size: 10),
                    ),
                    const SizedBox(width: 4),
                    const Spacer(),
                    UIReserveButton(text: "Reserve", onPressed: onPressed),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
