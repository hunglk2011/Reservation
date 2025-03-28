import 'package:reservation_system/models/class/product.dart';

class Restaurant {
  String? id;
  String? nameRestaurant;
  String? descriptionRestaurant;
  String? address;
  String? image;
  Product? product;
  String? comment;

  Restaurant({
    this.id,
    this.nameRestaurant,
    this.descriptionRestaurant,
    this.address,
    this.image,
    this.product,
    this.comment,
  });

  static Restaurant fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json["id"],
      nameRestaurant: json["name"],
      address: json["address"],
      image: json["image"],
      product:
          json['product'] != null && json['product'] is Map<String, dynamic>
              ? Product.fromJson(json['product'])
              : null,
      comment: json["comment"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": nameRestaurant,
      "address": address,
      "image": image,
      "product": product,
      "comment": comment,
    };
  }
}
