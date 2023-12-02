
import 'package:shared_preferences/shared_preferences.dart';
import '../global/show_toast.dart';
import 'prefs_keys.dart';

class MyPrefs {

  late SharedPreferences _prefs;

  Future<SharedPreferences> initSharePrefs() async {
    printTest('initializing SharedPreferences...');
    return _prefs = await SharedPreferences.getInstance();
  }

  void settBool({
    required PrefsKeys key,
    required bool value,
  }) async {
    await _prefs.setBool(key.name, value);
  }

  bool gettBool({required PrefsKeys key}) {
    return _prefs.getBool(key.name) ?? false;
  }

  void settString({
    required PrefsKeys key,
    required String? value,
  }) async {
    await _prefs.setString(key.name, value!);
  }

  String? gettString({required PrefsKeys key}) {
    return _prefs.getString(key.name);
  }

  void settInt({
    required PrefsKeys key,
    required int? value,
  }) async {
    await _prefs.setInt(key.name, value!);
  }

  int? gettInt({required PrefsKeys key}) {
    return _prefs.getInt(key.name);
  }

  Future<bool>? clearShared() {
    return _prefs.clear();
  }

  String getCurrentLanguage() {
    return _prefs.getString(PrefsKeys.langCode.name) ?? "en";
  }
}
