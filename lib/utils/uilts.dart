import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static const _storage = FlutterSecureStorage();
  static const String _LANDING_COMPLETED = "landingCompleted";

  static Future<void> deleteAllStorages() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<void> setLandingCompleted(bool isCompleted) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_run', false);
    await _storage.write(key: _LANDING_COMPLETED, value: isCompleted.toString());
  }

  static Future<bool> getLandingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    bool landingCompleted = true;
    bool? firstRun = prefs.getBool('first_run');
    if (firstRun ?? true) {
      FlutterSecureStorage storage = const FlutterSecureStorage();
      await storage.deleteAll();
      landingCompleted = false;
    } else {
      final result = await _storage.read(key: _LANDING_COMPLETED) == 'true';
      landingCompleted = result;
    }
    return landingCompleted;
  }
}
