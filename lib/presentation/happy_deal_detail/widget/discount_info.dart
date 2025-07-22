import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class DiscountInfo extends StatelessWidget {
  const DiscountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Free \n",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "2 drinks",
                  style: TextStyle(
                    color: Color(0xffAD3F32),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(Assets.images.imgCoca.path),
        ],
      ),
    );
  }
}