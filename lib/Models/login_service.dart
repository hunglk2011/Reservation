import 'package:shared_preferences/shared_preferences.dart';

class LoginKey {
  static const String isLoginKey = 'is_login_key';
}

class LoginService {
  static Future<void> saveLoginToLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LoginKey.isLoginKey, true);
  }

  static Future<bool> isLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(LoginKey.isLoginKey) ?? false;
  }

  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(LoginKey.isLoginKey);
  }
}
