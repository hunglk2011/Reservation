import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reservation_system/models/class/restaurant.dart';

class RestaurantService {
  static const domain = "67cafc073395520e6af3e3aa.mockapi.io";
  static const header = {"Content-type": "application/json"};

  static Future<List<Restaurant>> getRestaurantFromServer() async {
    var url = Uri.https(domain, "/restaurant");
    var response = await http.get(url);
    final listJson = jsonDecode(response.body) as List<dynamic>;

    final List<Restaurant> result =
        listJson.map((e) => Restaurant.fromJson(e)).toList();
    return result;
  }

  static Future<Restaurant?> getRestaurantById({required String id}) async {
    var url = Uri.https(domain, '/restaurant/$id');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Restaurant.fromJson(jsonData);
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return null;
    }
  }

  static Future<Restaurant> createNewRestaurant({
    required String nameRestaurant,
    required String address,
    required String image,
  }) async {
    var url = Uri.https(domain, '/restaurant');
    final restaurantRequestData = {
      "name": nameRestaurant,
      "address": address,
      "image": image,
    };

    final json = jsonEncode(restaurantRequestData);

    var response = await http.post(url, headers: header, body: json);

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final Restaurant restaurant = Restaurant.fromJson(data);

    return restaurant;
  }

  static Future<Restaurant?> updateRestaurant({
    required String id,
    required String nameRestaurant,
    required String comment,
  }) async {
    var url = Uri.https(domain, '/restaurant/$id');
    final restaurantUpdateData = {"name": nameRestaurant, "comment": comment};

    var response = await http.put(
      url,
      headers: header,
      body: jsonEncode(restaurantUpdateData),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Restaurant.fromJson(data);
    } else {
      return null;
    }
  }

  static Future<bool> deleteRestaurant({required String id}) async {
    var url = Uri.https(domain, '/restaurant/$id');
    var response = await http.delete(url, headers: header);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
