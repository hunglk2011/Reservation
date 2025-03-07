import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:reservation_system/gen/assets.gen.dart';

class SlideShow extends StatefulWidget {
  const SlideShow({super.key});

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffFA8072),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageSlideshow(
            indicatorColor: Color(0xffAD3F32),
            height: 166,
            width: 327,
            isLoop: true,
            autoPlayInterval: 2000,
            children: [
              Image.asset(Assets.images.imgSlideshow.path, fit: BoxFit.contain),
              Image.asset(
                Assets.images.imgDishCartoon.path,
                fit: BoxFit.contain,
              ),
              Image.asset(
                Assets.images.imgOrderCartoon.path,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
