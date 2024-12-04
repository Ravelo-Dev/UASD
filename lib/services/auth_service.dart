import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'https://uasdapi.ia3x.com';

  // Login method
  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final token = responseData['data']
          ['authToken']; // Asegúrate de que la clave es correcta
      await _saveToken(token);
      print("Inicio de sesión exitoso, token: $token");
      return responseData;
    } else {
      print('Error: ${response.statusCode}, ${response.body}');
      throw Exception('Error al iniciar sesión');
    }
  }

  // Método para recuperación de contraseña
  Future<String> resetPassword(String username, String email) async {
    final url = Uri.parse('$baseUrl/reset_password');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'accept': '*/*',
      },
      body: jsonEncode({
        'usuario': username,
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['success'] == true) {
        return responseData['message']; // Devuelve el mensaje de éxito
      } else {
        throw Exception(responseData['message'] ?? 'Error desconocido');
      }
    } else {
      throw Exception('Error al restablecer la contraseña');
    }
  }

  // Guardar el token en SharedPreferences
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
    print("Token guardado: $token");
  }

  // Guardar información adicional del usuario
  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', jsonEncode(userData));
  }

  // Obtener el token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  // Verificar si el usuario está autenticado
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    print("Token recuperado: $token");
    return token != null;
  }

  // Cerrar sesión (eliminar el token)
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
    await prefs.remove('userData'); // Opcional, si guardaste más datos
  }
}
