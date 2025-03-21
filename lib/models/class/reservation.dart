import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/models/class/user.dart';

enum ReservationStatus {
  finished,
  pending,
  cancelled,
  deposited,
  confirmed;

  static ReservationStatus fromString(String status) {
    switch (status) {
      case 'finished':
        return ReservationStatus.finished;
      case 'pending':
        return ReservationStatus.pending;
      case 'cancelled':
        return ReservationStatus.cancelled;
      case 'deposited':
        return ReservationStatus.deposited;
      case 'confirmed':
        return ReservationStatus.confirmed;
      default:
        return ReservationStatus.pending;
    }
  }
}

class Reservation {
  final String? id;
  DateTime? createdDate;
  DateTime? reservationDate;
  Restaurant? restaurantInfo;
  int? peopleCount;
  String? timeRange;
  ReservationStatus? status;
  User? userInfo;
  String? notes;
  Reservation({
    this.id,
    this.createdDate,
    this.reservationDate,
    this.peopleCount,
    this.timeRange,
    this.status = ReservationStatus.pending,
    this.restaurantInfo,
    this.userInfo,
    this.notes,
  });

  static Reservation fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] as String?,
      createdDate:
          json['createdDate'] != null
              ? DateTime.parse(json['createdDate'])
              : null,
      reservationDate:
          json['reservationDate'] != null
              ? DateTime.parse(json['reservationDate'])
              : null,
      peopleCount: json['peopleCount'] as int?,
      timeRange: json['timeRange'] as String?,
      status: ReservationStatus.fromString(json['status'] as String),
      restaurantInfo:
          json['restaurantInfo'] != null
              ? Restaurant.fromJson(json['restaurantInfo'])
              : null,
      userInfo:
          json['userInfo'] != null ? User.fromJson(json['userInfo']) : null,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "createdDate": createdDate?.toIso8601String(),
      "reservationDate": reservationDate?.toIso8601String(),
      "peopleCount": peopleCount,
      "timeRange": timeRange,
      "status": status?.name,
      "restaurantInfo": restaurantInfo?.toJson(),
      "userInfo": userInfo?.toJson(),
      "notes": notes,
    };
  }
}
