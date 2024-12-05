import 'package:flutter/material.dart';
import '../services/news_service.dart';
import '../models/news_model.dart';

class NewsViewModel extends ChangeNotifier {
  final NewsService _newsService = NewsService();
  bool isLoading = false;
  String errorMessage = '';
  List<News> newsList = [];

  // Método para cargar las noticias
  Future<void> loadNews() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      newsList = await _newsService.getNews();
    } catch (e) {
      errorMessage = 'Error al cargar las noticias.';
      print('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
