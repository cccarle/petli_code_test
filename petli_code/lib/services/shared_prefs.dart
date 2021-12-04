import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String CACHED_LIKE_IDS = "cached_like_ids";

  Future<String?> getStringValue(String key) async {
    var pref = await SharedPreferences.getInstance();

    String? _value = pref.getString(key);
    return _value; // == null ? '' : _value;
  }

  Future<bool> setStringValue(String key, String value) async {
    var pref = await SharedPreferences.getInstance();

    return await pref.setString(key, value);
  }
}
