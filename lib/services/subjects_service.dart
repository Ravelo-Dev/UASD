import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/subjects_model.dart';
import 'auth_service.dart';

class SubjectsService {
  final String baseUrl = 'https://uasdapi.ia3x.com';

  Future<List<Subjects>> getSubjects() async {
    final token = await AuthService().getToken();
    if (token == null) {
      throw Exception('Token no encontrado. El usuario no está autenticado.');
    }

    final url = Uri.parse('$baseUrl/materias_disponibles');
    final response = await http.get(
      url,
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      try {
        final List<dynamic> responseData =
            jsonDecode(response.body); // Decodifica correctamente la respuesta
        return responseData
            .map((subjectJson) => Subjects.fromJson(subjectJson))
            .toList();
      } catch (e) {
        throw Exception('Error al procesar los datos de materias: $e');
      }
    } else {
      throw Exception(
          'Error al obtener las materias disponibles: ${response.statusCode}');
    }
  }
}
