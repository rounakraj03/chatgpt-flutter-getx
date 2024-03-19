import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static SharedPreferences? _preferences;

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get preferences {
    if (_preferences == null) {
      throw Exception('AppStorage has not been initialized.');
    }
    return _preferences!;
  }

  Future<void> setString(String key, String value) async {
    await preferences.setString(key, value);
  }

  Future<String> getString(String key) async {
    return preferences.getString(key) ?? '';
  }

  Future<void> setBool(String key, bool value) async {
    await preferences.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    return preferences.getBool(key) ?? false;
  }

  Future<void> setInt(String key, int value) async {
    await preferences.setInt(key, value);
  }

  Future<int> getInt(String key) async {
    return preferences.getInt(key) ?? 0;
  }

  Future<void> clearAll() async {
    await preferences.clear();
  }
}
