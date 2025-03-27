import 'dart:convert';
import 'package:reservation_system/models/class/notification.dart';
import 'package:reservation_system/models/class/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveJsonData(
    String key,
    List<Map<String, dynamic>> data,
  ) async {
    if (prefs == null) return;
    String jsonString = jsonEncode(data);
    await prefs!.setString(key, jsonString);
  }

  static List<Map<String, dynamic>>? getJsonData(String key) {
    if (prefs == null) return null;
    String? jsonString = prefs!.getString(key);
    if (jsonString == null) return null;
    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.cast<Map<String, dynamic>>();
  }

  static Future<void> removeData(String key) async {
    if (prefs == null) return;
    await prefs!.remove(key);
  }

  static Future<void> updateData(User? user, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = jsonEncode(user?.toJson());
    await prefs.setString(key, value);
  }

  static Future<void> saveNotificationData(
    List<NotificationModel> notifications,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final String updatedJson = jsonEncode(
      notifications.map((e) => e.toJson()).toList(),
    );
    await prefs.setString('notifications', updatedJson);
  }

  static Future<List<NotificationModel>> getNotificationData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonData = prefs.getString('notifications');

    if (jsonData == null) {
      return [];
    }

    final List<dynamic> jsonList = jsonDecode(jsonData);
    return jsonList.map((json) => NotificationModel.fromJson(json)).toList();
  }

  static Future<void> markNotificationAsRead(String notificationId) async {
    final notifications = await getNotificationData();
    final index = notifications.indexWhere((e) => e.id == notificationId);
    if (index != -1) {
      notifications[index] = notifications[index].copyWith(isRead: true);
      await updateNotificationData(notifications);
    }
  }

  static Future<void> updateNotificationData(
    List<NotificationModel> notifications,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final String updatedJson = jsonEncode(
      notifications.map((e) => e.toJson()).toList(),
    );
    await prefs.setString('notifications', updatedJson);
  }
}
