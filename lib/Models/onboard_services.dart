import 'package:first_app/Models/apearance.dart';

class OnboardStorageKey {
  static const String isFirstOpenKey = 'is_first_open_key';
}

class OnboardService {
  static void saveOnboardToLocal() {
    final pres = Apearance.prefs;
    pres?.setBool(OnboardStorageKey.isFirstOpenKey, true);
  }

  static bool isFirstOpen() {
    final pres = Apearance.prefs;
    return pres?.getBool(OnboardStorageKey.isFirstOpenKey) ?? false;
  }
}
