import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/debts_model.dart';
import 'auth_service.dart';

class DebtsService {
  final String baseUrl = 'https://uasdapi.ia3x.com';

  Future<List<Debts>> getDebts() async {
    final token = await AuthService().getToken();
    if (token == null) {
      throw Exception('Token no encontrado. El usuario no está autenticado.');
    }

    final url = Uri.parse('$baseUrl/deudas');
    final response = await http.get(
      url,
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      try {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData
            .map((subjectJson) => Debts.fromJson(subjectJson))
            .toList();
      } catch (e) {
        throw Exception('Error al procesar los datos de sus deudas: $e');
      }
    } else {
      throw Exception(
          'Error al obtener las deudas pendientes: ${response.statusCode}');
    }
  }
}
