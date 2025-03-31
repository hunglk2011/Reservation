import 'package:flutter/material.dart';
import 'package:reservation_system/gen/assets.gen.dart';

class HappyDealCard extends StatelessWidget {
  final LinearGradient gradient;
  final bool isImageLeft;
  final String title;
  final List<String> subtitle;
  final VoidCallback? onPressed;

  const HappyDealCard({
    super.key,
    required this.gradient,
    required this.isImageLeft,
    required this.title,
    required this.subtitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: gradient,
      ),
      child: Row(
        children:
            isImageLeft
                ? [_buildImage(), _buildTextContent()]
                : [_buildTextContent(), _buildImage()],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: isImageLeft ? const Radius.circular(20) : Radius.zero,
        right: isImageLeft ? Radius.zero : const Radius.circular(20),
      ),
      child: SizedBox(
        width: 140,
        height: 140,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: isImageLeft ? 0 : null,
              right: isImageLeft ? null : 0,
              child: Image.asset(
                isImageLeft
                    ? Assets.images.imageBeefSpice.path
                    : Assets.images.imgBeef.path,
                width: 150,
                height: 120,
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                ...subtitle.map(
                  (text) => Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 5,
              child: GestureDetector(
                onTap: onPressed,
                child: CircleAvatar(
                  backgroundColor: Colors.white24,
                  radius: 14,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
