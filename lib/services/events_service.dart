import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/events_model.dart';
import 'auth_service.dart';

class EventsService {
  final String baseUrl = 'https://uasdapi.ia3x.com';

  Future<List<EventsModel>> getEvents() async {
    final token = await AuthService().getToken();
    if (token == null) {
      throw Exception('Token no encontrado. El usuario no está autenticado.');
    }

    final url = Uri.parse('$baseUrl/eventos');
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
            .map((subjectJson) => EventsModel.fromJson(subjectJson))
            .toList();
      } catch (e) {
        throw Exception('Error al procesar los eventos: $e');
      }
    } else {
      throw Exception('Error al obtener los eventos: ${response.statusCode}');
    }
  }
}
