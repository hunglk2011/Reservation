import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_bloc.dart';
import 'package:reservation_system/bloc/authentication/authentication_state.dart';
import 'package:reservation_system/bloc/notification/notification_bloc.dart';
import 'package:reservation_system/bloc/notification/notification_event.dart';
import 'package:reservation_system/bloc/notification/notification_state.dart';
import 'package:reservation_system/presentation/notification/notification_component/notification_card.dart';

import '../../routes/route_named.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationBloc _notificationBloc;
  @override
  void initState() {
    super.initState();
    _notificationBloc = NotificationBloc()..add(FetchNotification());
  }

  @override
  void dispose() {
    _notificationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _notificationBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
          actions: [
            TextButton(
              onPressed: () {
                _notificationBloc.add(MarkAsReadAll());
              },
              child: Text(
                "Mark as read",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        ),
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is! AuththenticateSuccess) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Please login to use our services",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.pushReplacementNamed(
                          context,
                          Routenamed.login,
                        );
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              );
            } else {
              return BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state is NotificationLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is FetchNotificationSuccess) {
                    return Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemCount: state.notificationList.length,
                        itemBuilder: (context, index) {
                          return NotificationCard(
                            notification: state.notificationList[index],
                            isRead: state.notificationList[index].isRead,
                            onPressed: () {
                              _notificationBloc.add(
                                MarkAsReadItem(
                                  notificationId:
                                      state.notificationList[index].id,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(child: Text("No notifications available."));
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
