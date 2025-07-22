import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class UserInfo extends StatelessWidget {
  final String? name;
  final String? phoneNumber;
  final String? email;
  const UserInfo({super.key, this.name, this.phoneNumber, this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(Assets.images.imageInfo.path),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name!, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(phoneNumber!),
              Text(email!),
            ],
          ),
        ],
      ),
    ),
  );
  }
}