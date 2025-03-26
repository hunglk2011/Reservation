import 'package:reservation_system/gen/assets.gen.dart';
import 'package:reservation_system/models/class/restaurant.dart';

class Product extends Restaurant {
  String? idProduct;
  String nameProduct;
  String descriptionProduct;
  double? price;
  String? imageProduct;
  int? reviewCount;
  Product({
    this.idProduct,
    required this.nameProduct,
    required this.descriptionProduct,
    this.price,
    this.imageProduct,
    this.reviewCount,
    super.address,
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      idProduct: json["idProduct"],
      nameProduct: json["nameProduct"] ?? "Unknown",
      descriptionProduct: json["descriptionProduct"] ?? "No description",
      price: json["price"] != null ? (json["price"] as double?) : null,
      imageProduct: json["imageProduct"] ?? Assets.images.imgLogoIcon.path,
      reviewCount:
          json["reviewCount"] != null
              ? int.tryParse(json["reviewCount"].toString()) ?? 0
              : 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "idProduct": idProduct,
      "nameProduct": nameProduct,
      "descriptionProduct": descriptionProduct,
      "imageProduct": imageProduct,
      "price": price,
      "reviewCount": reviewCount,
    };
  }
}
