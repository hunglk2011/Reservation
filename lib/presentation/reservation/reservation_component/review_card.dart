import 'package:flutter/material.dart';
import 'package:reservation_system/models/class/comment.dart';

class ReviewCard extends StatelessWidget {
  final Comment? comments;
  const ReviewCard({super.key, this.comments});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 343,
        height: 76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.person_2_rounded, size: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "@${comments!.id.toString()}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    comments!.createdDate.toString(),
                    style: TextStyle(fontSize: 10, color: Colors.blueGrey),
                  ),
                  Text(
                    comments!.comment.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
