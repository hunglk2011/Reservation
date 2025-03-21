import 'package:flutter/material.dart';

class UIReserveButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const UIReserveButton({
    super.key,
    required this.text,
    required this.onPressed,
    required String title,
  });

  @override
  State<UIReserveButton> createState() => _UIReserveButtonState();
}

class _UIReserveButtonState extends State<UIReserveButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: 94,
        height: 26,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFAD3F32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            textAlign: TextAlign.center,

            widget.text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
