import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Token
  Future<void> saveToken(String token) async {
    await _prefs.setString('token', token);
  }

  String? getToken() => _prefs.getString('token');

  Future<void> removeToken() async {
    await _prefs.remove('token');
  }

  // Status login
  Future<void> saveIsLoggedIn(bool value) async {
    await _prefs.setBool('is_logged_in', value);
  }

  bool getIsLoggedIn() => _prefs.getBool('is_logged_in') ?? false;

  // Data user
  Future<void> saveUserData({
    required String name,
    required String email,
  }) async {
    await _prefs.setString('user_name', name);
    await _prefs.setString('user_email', email);
  }

  String? getUserName() => _prefs.getString('user_name');
  String? getUserEmail() => _prefs.getString('user_email');

  // Clear semua (logout)
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
