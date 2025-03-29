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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: ImageSlideshow(
          indicatorColor: Color(0xffAD3F32),
          indicatorBackgroundColor: Colors.grey.shade400,
          height: 200,
          width: double.infinity,
          isLoop: true,
          autoPlayInterval: 3000,
          children: [
            Image.asset(Assets.images.imgSlideshow.path, fit: BoxFit.cover),
            Image.asset(Assets.images.imgRestaurant.path, fit: BoxFit.cover),
            Image.asset(Assets.images.imgBeef.path, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
