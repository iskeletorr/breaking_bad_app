import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enum/locale_keys_enum.dart';

class LocaleManager {
  static LocaleManager _instance = LocaleManager._init();
  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) => _preferences);
  }

  static preferencesInit() async {
    if (instance._preferences == null) {
      instance._preferences = await SharedPreferences.getInstance();
    }
    // return instance._preferences; //instance._preferences sonradan eklendi
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }
   Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) => _preferences?.getString(key.toString()) ?? "";
  bool getBoolValue(PreferencesKeys key) => _preferences?.getBool(key.toString()) ?? false;

}
