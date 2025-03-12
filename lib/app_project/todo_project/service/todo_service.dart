import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reservation_system/app_project/todo_project/class/task.dart';

class TodoService {
  static const domain = "67cafc073395520e6af3e3aa.mockapi.io";
  static const header = {"Content-type": "application/json"};

  static Future<List<Task>> getTaskFromServer() async {
    var url = Uri.https(domain, "/task");
    var response = await http.get(url);
    final listJson = jsonDecode(response.body) as List<dynamic>;

    final List<Task> result = listJson.map((e) => Task.fromJson(e)).toList();
    return result;
  }

  static Future<Task> createNewTask({required String taskName}) async {
    var url = Uri.https(domain, '/task');
    final taskRequestData = {"task": taskName, "isCompleted": false};

    final json = jsonEncode(taskRequestData);

    var response = await http.post(url, headers: header, body: json);

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final Task task = Task.fromJson(data);

    return task;
  }

  static Future<Task> updateTask({
    required String id,
    required String name,
  }) async {
    var url = Uri.https(domain, "/task/$id");
    final taskRequestData = {"task": name};
    final json = jsonEncode(taskRequestData);
    var response = await http.put(url, headers: header, body: json);

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final Task task = Task.fromJson(data);
    return task;
  }
}
