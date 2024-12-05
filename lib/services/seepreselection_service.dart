import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uasd_app_final/models/seepreselection_model.dart';
import 'auth_service.dart';

class SeePreselectionService {
  final String baseUrl = 'https://uasdapi.ia3x.com';

  Future<List<Seepreselection>> getPreselection() async {
    final token = await AuthService().getToken();
    if (token == null) {
      throw Exception('Token no encontrado. El usuario no está autenticado.');
    }

    final url = Uri.parse('$baseUrl/ver_preseleccion');
    final response = await http.get(
      url,
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      try {
        // Decodificar la respuesta
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        // Verificar si el campo "data" es una lista
        if (responseData.containsKey('data') && responseData['data'] is List) {
          final List<dynamic> subjectsData = responseData['data'];

          // Mapear la lista a objetos Seepreselection
          return subjectsData
              .map((subjectJson) => Seepreselection.fromJson(subjectJson))
              .toList();
        } else {
          throw Exception('El campo "data" no contiene una lista válida.');
        }
      } catch (e) {
        throw Exception('Error al procesar los datos de materias: $e');
      }
    } else {
      throw Exception(
          'Error al obtener las materias disponibles: ${response.statusCode}');
    }
  }
}
