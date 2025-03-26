import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/models/class/user.dart';

enum ReservationStatus {
  finished,
  pending,
  cancelled,
  deposited,
  confirmed;

  static ReservationStatus fromString(String status) {
    status = status.replaceFirst('ReservationStatus.', '');
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
  int? amount;
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
    this.amount,
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
              ? DateTime.tryParse(json['reservationDate'])
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
      amount: json['amount'] as int?,
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
      "amount": amount,
    };
  }

  Reservation copyWith({
    String? id,
    DateTime? reservationDate,
    ReservationStatus? status,
    Restaurant? restaurantInfo,
    int? peopleCount,
    String? timeRange,
    User? userInfo,
  }) {
    return Reservation(
      id: id ?? this.id,
      reservationDate: reservationDate ?? this.reservationDate,
      status: status ?? this.status,
      restaurantInfo: restaurantInfo ?? this.restaurantInfo,
      peopleCount: peopleCount ?? this.peopleCount,
      timeRange: timeRange ?? this.timeRange,
      userInfo: userInfo ?? this.userInfo,
    );
  }
}
