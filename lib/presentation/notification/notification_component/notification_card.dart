import 'package:flutter/material.dart';
import 'package:reservation_system/presentation/notification/helper/notification_extension.dart';
import '../../../gen/assets.gen.dart';
import '../../../models/class/notification.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onPressed;
  final bool isRead;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.isRead,
    required this.onPressed,
  });

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
        title: notification.getNotificationMessage(),
        trailing:
            isRead
                ? Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey)
                : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, color: Colors.red, size: 12),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
        onTap: onPressed,
      ),
    );
  }
}
