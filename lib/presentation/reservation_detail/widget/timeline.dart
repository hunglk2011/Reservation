import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Timeline extends StatelessWidget {
  final DateTime? reservationDate;
  const Timeline({super.key, this.reservationDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 340,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              buildTimelineTile(
                isFirst: true,
                isCompleted: true,
                title: "Finished",
                time: "17:00, ${reservationDate.toString()}",
              ),
              buildTimelineTile(
                isCompleted: false,
                title: "Confirmed",
                time: "16:00, ${reservationDate.toString()}",
              ),
              buildTimelineTile(
                isCompleted: false,
                title: "Deposited",
                time: "09:50, ${reservationDate.toString()}",
              ),
              buildTimelineTile(
                isLast: true,
                isCompleted: false,
                title: "Pending",
                time: "09:45, Monday 22nd Sep 2021",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimelineTile({
    required String title,
    required String time,
    bool isFirst = false,
    bool isLast = false,
    required bool isCompleted,
  }) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(color: Colors.grey, thickness: 2),
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: isCompleted ? Colors.green : Colors.grey,
        iconStyle:
            isCompleted
                ? IconStyle(
                  iconData: Icons.check,
                  color: Colors.white,
                  fontSize: 14,
                )
                : null,
      ),
      endChild: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4),
            Text(time, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
