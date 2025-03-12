import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reservation_system/app_project/todo_project/class/user.dart';

class UserService {
  static const domain = "67cafc073395520e6af3e3aa.mockapi.io";
  static const header = {"Content-type": "application/json"};

  static Future<List<User>> getTaskFromServer() async {
    var url = Uri.https(domain, "/userInfo");
    var response = await http.get(url);
    final listJson = jsonDecode(response.body) as List<dynamic>;

    final List<User> result = listJson.map((e) => User.fromJson(e)).toList();
    return result;
  }

  static Future<User> createNewTask({
    required String userName,
    required String phoneNumber,
  }) async {
    var url = Uri.https(domain, '/userInfo');
    final userRequestData = {"name": userName, "phoneNumber": phoneNumber};

    final json = jsonEncode(userRequestData);

    var response = await http.post(url, headers: header, body: json);

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final User user = User.fromJson(data);

    return user;
  }
}
