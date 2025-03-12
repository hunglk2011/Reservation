import 'package:flutter/material.dart';

class PickDay extends StatefulWidget {
  const PickDay({super.key});

  @override
  State<PickDay> createState() => _PickDayState();
}

class _PickDayState extends State<PickDay> {
  DateTime selectedDate = DateTime.now();
  int selectedDay = DateTime.now().day;
  List<DateTime> getWeekDates() {
    DateTime startDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day - 2,
    );
    return List.generate(6, (index) => startDate.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> weeks = getWeekDates();
    return SizedBox(
      width: 283,
      height: 87,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weeks.length,
        itemBuilder: (context, index) {
          DateTime date = weeks[index];
          bool isSelected = date.day == selectedDay;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDay = date.day;
              });
            },
            child: Container(
              width: 49,
              height: 72,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xffAD3F32) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 5),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${date.day}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    ["MO", "TU", "WE", "TH", "FR", "SA", "SU"][date.weekday -
                        1],
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? Colors.white : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
