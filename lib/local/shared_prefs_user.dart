import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUserHelper {
  static const String _kUsernameKey = 'username';
  static const String _kEmailKey = 'email';
  static const String _kHonorPointsKey = 'honorPoints';

  static Future<void> saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kUsernameKey, username);
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kUsernameKey);
  }

  static Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kEmailKey, email);
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kEmailKey);
  }

  static Future<void> saveHonorPoints(int honorPoints) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kHonorPointsKey, honorPoints);
  }

  static Future<int?> getHonorPoints() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_kHonorPointsKey);
  }
}
