import 'package:flutter/material.dart';
import 'package:reservation_system/presentation/notification/notification_component/notification_card.dart';
import 'package:reservation_system/presentation/notification/notification_data.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, String>> notifications =
      NotificationData.notifications;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Mark as read",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationCard(
              title: notifications[index]["title"]!,
              time: notifications[index]["time"]!,
            );
          },
        ),
      ),
    );
  }
}
