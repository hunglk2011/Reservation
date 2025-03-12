import 'package:flutter/material.dart';
import 'package:reservation_system/component/button/ui_dropdown_button.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/pick_day.dart';
import 'package:reservation_system/presentation/reservation/reservation_data/reservation_data.dart';

class DateSection extends StatefulWidget {
  final Widget body;
  final String title;
  final VoidCallback? onPress;
  const DateSection({
    super.key,
    required this.title,
    required this.body,
    this.onPress,
  });

  @override
  State<DateSection> createState() => _DateSectionState();
}

class _DateSectionState extends State<DateSection> {
  int selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildTitle(context), _buildbody(context)],
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
        UIDropdownButton(
          itemList: MonthData.month,
          value: MonthData.month.first,
        ),

        DropdownButton<int>(
          value: selectedYear,
          items: List.generate(20, (index) {
            int year = DateTime.now().year - 10 + index;
            return DropdownMenuItem(value: year, child: Text("$year"));
          }),
          onChanged: (value) {
            setState(() {
              selectedYear = value!;
            });
          },
        ),
      ],
    );
  }
}

Widget _buildbody(BuildContext context) {
  return PickDay();
}
