import 'package:flutter/material.dart';
import 'package:hunian_app/core/storage/storage_service.dart';
import 'package:hunian_app/services/auth_service.dart';

class AuthController extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = await AuthService().login(email, password);
      await StorageService().saveIsLoggedIn(true);
      await StorageService().saveToken(user.id);
      await StorageService().saveUserData(name: user.name, email: user.email);

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await StorageService().clearAll();
    notifyListeners();
  }
}
