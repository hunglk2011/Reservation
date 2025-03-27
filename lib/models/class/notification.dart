import 'dart:math';
import 'package:reservation_system/models/class/reservation.dart';

class NotificationModel {
  final String id;
  final Reservation? reservation;
  final DateTime? createdAt;
  final bool isRead;

  NotificationModel({
    String? id,
    this.reservation,
    this.createdAt,
    this.isRead = false,
  }) : id = id ?? (reservation?.id ?? _generateRandomId());

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      reservation:
          json["reservation"] != null
              ? Reservation.fromJson(json["reservation"])
              : null,
      isRead: json['isRead'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reservation': reservation?.toJson(),
      'isRead': isRead,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  NotificationModel copyWith({
    String? id,
    Reservation? reservation,
    bool? isRead,
    DateTime? createdAt,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      reservation: reservation ?? this.reservation,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static String _generateRandomId() {
    final random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }
}
