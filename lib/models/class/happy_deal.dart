import 'package:reservation_system/models/class/reservation.dart';

class HappyDeal {
  String? id;
  Reservation? reservation;
  HappyDeal({this.id, this.reservation});

  static HappyDeal fromJson(Map<String, dynamic> json) {
    return HappyDeal(id: json["id"], reservation: json["reservation"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "reservation": reservation};
  }
}
