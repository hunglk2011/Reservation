import 'package:flutter/material.dart';
import 'package:reservation_system/presentation/review_restaurant/widget/comment.dart';
import 'package:reservation_system/presentation/review_restaurant/widget/upload_photo.dart';

import '../../../component/button/ui_button.dart';
import '../../../models/class/reservation.dart';
import 'rating_bar.dart';

class ReviewRestaurantBody extends StatelessWidget {
   final Reservation? reservation;
  final TextEditingController? commentController;
  final VoidCallback? submit;
  const ReviewRestaurantBody({super.key, this.reservation, this.commentController, this.submit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "#${reservation?.id.toString()}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff483332),
              ),
            ),
          ),
          // Container(
          //   width: 327,
          //   height: 155,
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          //   child: Image.network(
          //     reservation?.restaurantInfo?.image ?? '',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Center(
            child: Text(
              "ABC Restaurant",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff483332),
              ),
            ),
          ),
          SizedBox(height: 10),
          RatingBar(rating: 5),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReviewComment(commentController: commentController),
              SizedBox(height: 10),
              UploadPhoto(),
              SizedBox(height: 10),
            ],
          ),
          CustomButton(text: "SEND", onPressed: submit),
        ],
      ),
    );
  }
}