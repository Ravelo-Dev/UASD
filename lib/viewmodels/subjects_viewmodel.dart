import 'package:flutter/material.dart';
import '../services/subjects_service.dart';
import '../models/subjects_model.dart';

class SubjectsViewmodel extends ChangeNotifier {
  final SubjectsService _subjectsService = SubjectsService();
  bool isLoading = false;
  String errorMessage = '';
  List<Subjects> subjectsList = [];

  // Método para cargar las noticias
  Future<void> loadSubjects() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      subjectsList = await _subjectsService.getSubjects();
    } catch (e) {
      errorMessage = 'Error al cargar las materias.';
      print('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
