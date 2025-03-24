import 'package:flutter/material.dart';

class ReviewComment extends StatelessWidget {
  final TextEditingController? commentController;
  const ReviewComment({super.key, this.commentController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Comment",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Container(
          width: 327,
          height: 136,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xffE5E5E5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: commentController,
              maxLines: 5,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Write your comment here",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
