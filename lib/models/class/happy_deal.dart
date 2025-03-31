import 'package:reservation_system/models/class/restaurant.dart';

class HappyDeal {
  String? id;
  String? name;
  String? description;
  double? discountPercent;
  DateTime? expiryDate;
  Restaurant? restaurant;

  HappyDeal({
    this.id,
    this.name,
    this.description,
    this.discountPercent,
    this.expiryDate,
    this.restaurant,
  });

  static HappyDeal fromJson(Map<String, dynamic> json) {
    return HappyDeal(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      discountPercent: (json["discountPercent"] as num?)?.toDouble(),
      expiryDate:
          json["expiryDate"] != null
              ? DateTime.parse(json["expiryDate"])
              : null,
      restaurant:
          json["restaurant"] != null
              ? Restaurant.fromJson(json["restaurant"])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "discountPercent": discountPercent,
      "expiryDate": expiryDate?.toIso8601String(),
      "restaurant": restaurant?.toJson(),
    };
  }
}
