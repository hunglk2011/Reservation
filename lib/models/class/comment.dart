import 'package:reservation_system/models/class/restaurant.dart';

class Comment {
  String? id;
  String? comment;
  DateTime? createdDate;
  Restaurant? restaurant;

  Comment({this.id, this.comment, this.createdDate, this.restaurant});

  static Comment fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json["id"],
      comment: json["comment"],
      createdDate:
          json['createdDate'] != null
              ? DateTime.parse(json['createdDate'])
              : null,
      restaurant: json["restaurant"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "comment": comment,
      "createdDate": createdDate?.toIso8601String(),
      "restaurant": restaurant,
    };
  }
}
