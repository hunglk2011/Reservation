import 'package:flutter/material.dart';

class TimeSection extends StatefulWidget {
  final String title;
  final Function(TimeOfDay)? onTimeChanged;
  const TimeSection({super.key, required this.title, this.onTimeChanged});

  @override
  State<TimeSection> createState() => _TimeSectionState();
}

class _TimeSectionState extends State<TimeSection> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildTitle(context)],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff483332),
          ),
        ),

        ElevatedButton(
          onPressed: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: selectedTime ?? TimeOfDay.now(),
            );
            if (pickedTime != null) {
              setState(() {
                selectedTime = pickedTime;
              });
              widget.onTimeChanged?.call(selectedTime!);
            }
          },
          child: Text(
            selectedTime?.format(context) ?? TimeOfDay.now().format(context),
          ),
        ),
      ],
    );
  }
}
