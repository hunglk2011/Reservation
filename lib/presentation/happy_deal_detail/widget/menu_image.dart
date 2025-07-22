import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class MenuImage extends StatelessWidget {
  final double? percent;
  const MenuImage({super.key, this.percent});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "UP TO \n",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "${percent.toString()}% \n",
                  style: TextStyle(
                    color: Color(0xffAD3F32),
                    fontSize: 55,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: "OFF \n \n \n",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: "NO UPPER LIMIT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Image.asset(Assets.images.imgBeef.path, fit: BoxFit.cover),
        ),
      ],
    );
  }
}