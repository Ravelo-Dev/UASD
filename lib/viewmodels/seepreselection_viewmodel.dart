import 'package:flutter/material.dart';
import '../services/seepreselection_service.dart';
import '../models/seepreselection_model.dart';

class SeepreselectionViewmodel extends ChangeNotifier {
  final SeePreselectionService _seepreselectionService =
      SeePreselectionService();
  bool isLoading = false;
  String errorMessage = '';
  List<Seepreselection> preselectionList = [];

  // Método para cargar las noticias
  Future<void> loadPreselection() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      preselectionList = await _seepreselectionService.getPreselection();
    } catch (e) {
      errorMessage = 'Error al cargar las materias preseleccionadas.';
      print('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
