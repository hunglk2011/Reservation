import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reservation_system/models/class/product.dart';

class ProductService {
  static const domain = "67cafc073395520e6af3e3aa.mockapi.io";
  static const header = {"Content-type": "application/json"};

  static Future<List<Product>> getProductFromServer() async {
    var url = Uri.https(domain, "/product");
    var response = await http.get(url);
    final listJson = jsonDecode(response.body) as List<dynamic>;

    final List<Product> result =
        listJson.map((e) => Product.fromJson(e)).toList();
    return result;
  }

  static Future<Product> createNewProduct({
    required String nameProduct,
    required String description,
    required int reviewCount,
    required String image,
  }) async {
    var url = Uri.https(domain, '/product');
    final productRequestData = {
      "name": nameProduct,
      "description": description,
      "reviewCount": reviewCount,
      "image": image,
    };

    final json = jsonEncode(productRequestData);

    var response = await http.post(url, headers: header, body: json);

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final Product product = Product.fromJson(data);

    return product;
  }

  static Future<Product?> updateProduct({
    required String id,
    required String nameProduct,
    required String description,
    required int reviewCount,
    required String image,
  }) async {
    var url = Uri.https(domain, '/product/$id');
    final productUpdateData = {
      "name": nameProduct,
      "description": description,
      "reviewCount": reviewCount,
      "image": image,
    };

    var response = await http.put(
      url,
      headers: header,
      body: jsonEncode(productUpdateData),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Product.fromJson(data);
    } else {
      return null;
    }
  }
}
