import 'package:flutter/material.dart';

class UIDropdownButton extends StatefulWidget {
  final List<String> itemList;
  final String value;
  final ValueChanged<String?>? onChanged;
  const UIDropdownButton({
    super.key,
    required this.itemList,
    required this.value,
    this.onChanged,
  });

  @override
  State<UIDropdownButton> createState() => _UIDropdownButtonState();
}

class _UIDropdownButtonState extends State<UIDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: widget.value,
      items:
          widget.itemList.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: (String? newValue) {
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
    );
  }
}
