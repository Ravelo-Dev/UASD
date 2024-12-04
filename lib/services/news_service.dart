import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';
import 'auth_service.dart';

class NewsService {
  final String baseUrl = 'https://uasdapi.ia3x.com';

  // Método para obtener las noticias
  Future<List<News>> getNews() async {
    final token = await AuthService().getToken();
    if (token == null) {
      throw Exception('Token no encontrado. El usuario no está autenticado.');
    }

    final url = Uri.parse('$baseUrl/noticias');
    final response = await http.get(
      url,
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $token', // Se usa el token en la cabecera
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final List<dynamic> newsList = responseData['data'];
      return newsList.map((newsJson) => News.fromJson(newsJson)).toList();
    } else {
      throw Exception('Error al obtener las noticias');
    }
  }
}
