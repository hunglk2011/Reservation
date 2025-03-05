import 'dart:ui';

import 'package:first_app/Widget/button_reserve.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String nameProduct;
  final String address;
  final String? image;
  const ProductCard(
      {super.key,
      required this.nameProduct,
      required this.address,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 222,
      width: 152,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ]),
      child: Column(
        children: [
          Image.asset(
            "asset/img_product_beef.png",
            width: 148,
            height: 100,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    nameProduct,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff483332),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.place_rounded, size: 14),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        address,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                ButtonReserve(text: "Reserve", onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
