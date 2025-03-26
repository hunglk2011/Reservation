import 'package:flutter/material.dart';
import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/notification.dart';
import 'package:reservation_system/presentation/notification/helper/notification_extension.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel? notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Image.asset(
          Assets.images.imgLogoIcon.path,
          width: 40,
          height: 40,
        ),
        title: notification?.getNotificationMessage(),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: () {},
      ),
    );
  }
}
