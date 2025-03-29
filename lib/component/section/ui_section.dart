import 'package:flutter/material.dart';

class UISection extends StatelessWidget {
  const UISection({
    super.key,
    required this.body,
    required this.title,
    this.onPress,
  });

  final Widget body;
  final String title;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 50, maxHeight: double.infinity),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildTitle(context), body],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff483332),
            ),
          ),
          TextButton(
            onPressed: onPress,
            child: Row(
              children: [
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff999999),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
