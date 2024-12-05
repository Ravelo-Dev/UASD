import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/video_model.dart';
import 'auth_service.dart';

class VideoService {
  final String baseUrl = 'https://uasdapi.ia3x.com';

  Future<List<Video>> fetchVideos() async {
    final token = await AuthService().getToken();
    final url = Uri.parse('$baseUrl/videos');
    final response = await http.get(
      url,
      headers: {
        'Authorization': token ?? '',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((video) => Video.fromJson(video)).toList();
    } else {
      throw Exception('Error al obtener los videos');
    }
  }
}
