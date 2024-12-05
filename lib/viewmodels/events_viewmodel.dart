import 'package:flutter/material.dart';
import '../services/events_service.dart';
import '../models/events_model.dart';

class EventsViewmodel extends ChangeNotifier {
  final EventsService _eventsService = EventsService();
  bool isLoading = false;
  String errorMessage = '';
  List<EventsModel> eventsList = [];

  // Método para cargar las noticias
  Future<void> loadEvents() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      eventsList = await _eventsService.getEvents();
    } catch (e) {
      errorMessage = 'Error al cargar las materias.';
      print('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
