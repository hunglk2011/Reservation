import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final int? rating;
  const RatingBar({super.key, this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        rating!,
        (index) => Icon(Icons.star, color: Color(0xffA93528), size: 45),
      ),
    );
  }
}
