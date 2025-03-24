import 'package:flutter/material.dart';
import 'package:reservation_system/component/button/ui_dropdown_button.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/pick_day.dart';
import 'package:reservation_system/presentation/reservation/reservation_data/reservation_data.dart';

class DateSection extends StatefulWidget {
  final Widget body;
  final String title;
  final Function(DateTime) onDateChanged;
  const DateSection({
    super.key,
    required this.title,
    required this.body,
    required this.onDateChanged,
  });

  @override
  State<DateSection> createState() => _DateSectionState();
}

class _DateSectionState extends State<DateSection> {
  int selectedYear = DateTime.now().year;
  String selectedMonth = MonthData.month.first;
  int selectedDay = DateTime.now().day;

  void _updateSelectedDate() {
    final newDate = DateTime(
      selectedYear,
      MonthData.month.indexOf(selectedMonth) + 1,
      selectedDay,
    );
    widget.onDateChanged(newDate);
  }

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
          value: selectedMonth,
          onChanged: (value) {
            selectedMonth = value!;
            _updateSelectedDate();
          },
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
              _updateSelectedDate();
            });
          },
        ),
      ],
    );
  }

  Widget _buildbody(BuildContext context) {
    return PickDay(
      selectedDay: selectedDay,
      onDaySelected: (day) {
        setState(() {
          selectedDay = day;
          _updateSelectedDate();
        });
      },
    );
  }
}
