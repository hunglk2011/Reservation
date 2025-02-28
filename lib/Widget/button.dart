import 'package:flutter/material.dart';

class ButtonSignup extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const ButtonSignup({super.key, required this.text, this.onPressed});

  @override
  _ButtonSignupState createState() => _ButtonSignupState();
}

class _ButtonSignupState extends State<ButtonSignup> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
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
    );
  }
}
