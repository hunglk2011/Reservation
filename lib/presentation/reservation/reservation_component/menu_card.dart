import 'package:flutter/material.dart';
import 'package:reservation_system/models/class/product.dart';

class MenuCard extends StatelessWidget {
  final Product? product;
  const MenuCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 343,
        height: 98,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(
              product?.imageProduct ?? 'assets/images/default_image.png',
              width: 139.51,
              height: 76,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.nameProduct ?? "Name Product",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Icon(Icons.circle, color: Color(0xffA04E3F), size: 9),
                    SizedBox(width: 6),
                    Text(
                      "Obathan Sauce",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.circle, color: Color(0xffC89055), size: 9),
                    SizedBox(width: 6),
                    Text(
                      "Honey Sauce",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  product!.price.toString(),
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
