import 'package:flutter/material.dart';
import 'package:reservation_system/gen/assets.gen.dart';

class HappyDealCard extends StatelessWidget {
  final LinearGradient gradient;
  final Alignment imageAlignment;
  final String title;
  final List<String> subtitle;
  final VoidCallback? onPressed;

  const HappyDealCard({
    super.key,
    required this.gradient,
    required this.imageAlignment,
    required this.title,
    required this.subtitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: gradient,
      ),
      child: Stack(
        children: [
          Align(
            alignment: imageAlignment,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(Assets.images.imgBeef.path, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                for (var text in subtitle)
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.white24,
                    maxRadius: 12,
                    minRadius: 9,
                    child: IconButton(
                      onPressed: onPressed,
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 9,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
