import 'package:reservation_system/models/share_preference/preferences.dart';

class OnboardStorageKey {
  static const String isFirstOpenKey = 'is_first_open_key';
}

class OnboardService {
  static void saveOnboardToLocal() {
    final pres = AppPreferece.prefs;
    pres?.setBool(OnboardStorageKey.isFirstOpenKey, true);
  }

  static bool isFirstOpen() {
    final pres = AppPreferece.prefs;
    return pres?.getBool(OnboardStorageKey.isFirstOpenKey) ?? false;
  }
}
