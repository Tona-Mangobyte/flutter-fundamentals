import 'package:shared_preferences/shared_preferences.dart';

mixin SharePreferencesUtil {
  static const _locale = 'locale';


  static Future getValue(String key) async {
    final sharePreference = await SharedPreferences.getInstance();
    return sharePreference.getString(key);
  }

  static Future getLocalePrefs() async {
    final locale = await SharePreferencesUtil.getValue(_locale);
    return locale ?? 'en';
  }

  static Future setLocalePrefs(String value) async {
    final sharePreference = await SharedPreferences.getInstance();
    return await sharePreference.setString(_locale, value);
  }
}