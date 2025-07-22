import 'package:flutter/material.dart';

import '../../../component/button/ui_button.dart';
import '../../../gen/assets.gen.dart';

class TermsAndConditions extends StatelessWidget {
  final double? percent;
  final DateTime? expired;
  final VoidCallback? onPressed;
  const TermsAndConditions({super.key, this.expired, this.percent, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Terms & Condition",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${percent.toString()} off ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffAD3F32),
                      ),
                    ),
                    TextSpan(
                      text: "for family reservation \n \n \n",
                      style: TextStyle(fontSize: 14, color: Color(0xffAD3F32)),
                    ),
                    TextSpan(
                      text: "Time slots from 10:00 to 15:00",
                      style: TextStyle(fontSize: 14, color: Color(0xffAD3F32)),
                    ),
                  ],
                ),
              ),
              Image.asset(Assets.images.imgFamilyCartoon.path),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(Assets.images.imgMan.path),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Applicable to all branches \n \n \n",
                      style: TextStyle(fontSize: 14, color: Color(0xffAD3F32)),
                    ),
                    TextSpan(
                      text:
                          "Valid until ${expired?.day.toString()}/${expired?.month.toString()}/${expired?.year.toString()}",
                      style: TextStyle(fontSize: 14, color: Color(0xffAD3F32)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomButton(text: "GET IT NOW", onPressed: onPressed),
        ],
      ),
    );
  }
}