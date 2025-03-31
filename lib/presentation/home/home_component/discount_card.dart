import 'package:flutter/material.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/happy_deal.dart';

class DiscountCard extends StatelessWidget {
  final VoidCallback? onPressed;
  final HappyDeal? happyDeal;

  const DiscountCard({super.key, this.happyDeal, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 244,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Color(0xFFFF8C7E), Color(0xFFF7B799)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  happyDeal?.name ?? "No Name",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  happyDeal?.description ?? "No Description",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                SizedBox(height: 4),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: " ${happyDeal?.discountPercent ?? 0}% OFF \n",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.orange,
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 6),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                Assets.images.imgBeef.path,
                width: 50,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
