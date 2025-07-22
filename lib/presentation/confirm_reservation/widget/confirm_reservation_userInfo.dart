// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';

class ConfirmReservationUserinfo extends StatelessWidget {
  final String? name;
  final String? phoneNumber;
  final String? email;

  const ConfirmReservationUserinfo({
    super.key,
    this.name,
    this.phoneNumber,
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(Assets.images.imageInfo.path),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(phoneNumber ?? ""),
            Text(email ?? ""),
          ],
        ),
      ],
    );
  }
}