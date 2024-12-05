import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../views/home_view.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool isLoading = false;
  String errorMessage = '';

  // Método de login
  Future<void> login(
      BuildContext context, String username, String password) async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      await _authService.login(username, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } catch (e) {
      errorMessage = 'Credenciales incorrectas o error de red.';
      print('Error en login: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
