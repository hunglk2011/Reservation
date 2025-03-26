import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/notification/notification_bloc.dart';
import 'package:reservation_system/bloc/notification/notification_event.dart';
import 'package:reservation_system/bloc/notification/notification_state.dart';
import 'package:reservation_system/presentation/notification/notification_component/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc()..add(FetchNotification()),
      child: Scaffold(
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
        body: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FetchNotificationSuccess) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: state.notificationList.length,
                  itemBuilder: (context, index) {
                    return NotificationCard(
                      notification: state.notificationList[index],
                    );
                  },
                ),
              );
            } else {
              return Center(child: Text("No notifications available."));
            }
          },
        ),
      ),
    );
  }
}
