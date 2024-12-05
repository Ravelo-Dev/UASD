import 'package:flutter/material.dart';
import '../models/video_model.dart';
import '../services/video_service.dart';

class VideosViewModel extends ChangeNotifier {
  final VideoService _videoService = VideoService();
  List<Video> videos = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> loadVideos() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      videos = await _videoService.fetchVideos();
    } catch (e) {
      errorMessage = 'Error al cargar los videos: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
