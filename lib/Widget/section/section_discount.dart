import 'package:first_app/Widget/discount/discount_card.dart';
import 'package:flutter/material.dart';

class SectionDiscount extends StatelessWidget {
  final String title;
  const SectionDiscount({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff483332)),
            ),
            Text(
              "See All",
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff999999),
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        Center(
          child: DiscountCard(),
        )
      ],
    );
  }
}
