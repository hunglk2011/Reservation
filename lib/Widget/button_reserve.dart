import 'package:flutter/material.dart';

class ButtonReserve extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const ButtonReserve({super.key, required this.text, required this.onPressed});

  @override
  State<ButtonReserve> createState() => _ButtonReserveState();
}

class _ButtonReserveState extends State<ButtonReserve> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: 129,
        height: 44,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFAD3F32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
