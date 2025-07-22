import 'package:flutter/material.dart';
import '../../../component/textinput/ui_text_input.dart';

class UITextField extends StatelessWidget {
 final TextEditingController? controller;
 final String? hint;
  const UITextField({super.key, this.controller, this.hint});

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: UITextInput(
          hintText: hint!,
          type: "text",
          controller: controller,
        ),
      ),
    );
  }
}