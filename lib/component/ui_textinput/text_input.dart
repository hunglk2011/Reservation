import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final String type;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const TextInput({
    super.key,
    required this.hintText,
    required this.type,
    this.obscureText = false,
    this.validator,
    this.controller,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late bool isShow;

  @override
  void initState() {
    super.initState();
    isShow = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: typeInput(widget.type),
      obscureText: widget.type == "password" ? isShow : false,
      decoration: InputDecoration(
        suffixIcon:
            widget.type == "password"
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      isShow = !isShow;
                    });
                  },
                  icon: Icon(
                    isShow ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                )
                : null,
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        alignLabelWithHint: true,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontFamily: 'Tahoma',
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      validator: widget.validator,
    );
  }
}

TextInputType typeInput(String type) {
  switch (type) {
    case 'email':
      return TextInputType.emailAddress;
    case 'number':
      return TextInputType.number;
    case 'phone':
      return TextInputType.phone;
    case 'datetime':
      return TextInputType.datetime;
    case 'text':
    default:
      return TextInputType.text;
  }
}
