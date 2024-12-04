import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/request_type_model.dart';
import '../models/request_model.dart';
import 'auth_service.dart';

class SolicitudesService {
  final String baseUrl = 'https://uasdapi.ia3x.com';

  Future<List<RequestType>> getTiposSolicitudes() async {
    final token = await AuthService().getToken();
    if (token == null) {
      throw Exception('Usuario no autenticado.');
    }

    final url = Uri.parse('$baseUrl/tipos_solicitudes');
    final response = await http.get(
      url,
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List;
      return data.map((e) => RequestType.fromJson(e)).toList();
    } else {
      throw Exception('Error al cargar los tipos de solicitudes.');
    }
  }

  Future<List<RequestModel>> getMisSolicitudes() async {
    final token = await AuthService().getToken();
    if (token == null) {
      throw Exception('Usuario no autenticado.');
    }

    final url = Uri.parse('$baseUrl/mis_solicitudes');
    final response = await http.get(
      url,
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List;
      return data.map((e) => RequestModel.fromJson(e)).toList();
    } else {
      throw Exception('Error al cargar las solicitudes.');
    }
  }

  Future<void> crearSolicitud(String tipo, String descripcion) async {
    final token = await AuthService().getToken();
    if (token == null) {
      throw Exception('Usuario no autenticado.');
    }

    final url = Uri.parse('$baseUrl/crear_solicitud');
    final response = await http.post(
      url,
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'tipo': tipo,
        'descripcion': descripcion,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al crear la solicitud.');
    }
  }
}
