import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/restaurant.dart';

class Product extends Restaurant {
  String nameProduct;
  String descriptionProduct;
  double? price;
  String? imageProduct;
  int? reviewCount;
  Product({
    required this.nameProduct,
    required this.descriptionProduct,
    this.price,
    this.imageProduct,
    this.reviewCount,
    super.address,
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      nameProduct: json["name"] ?? "Unknown",
      descriptionProduct: json["desciption"] ?? "No description",
      imageProduct: json["image"] ?? Assets.images.imgLogoIcon.path,
      reviewCount: int.parse(json["reviewCount"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": nameProduct,
      "desciption": descriptionProduct,
      "image": imageProduct,
      "reviewCount": reviewCount,
    };
  }
}
