import 'package:flutter/material.dart';
import '../services/tasks_service.dart';
import '../models/tasks_model.dart';

class TasksViewmodel extends ChangeNotifier {
  final TasksService _tasksService = TasksService();
  bool isLoading = false;
  String errorMessage = '';
  List<TasksModel> tasksList = [];

  // Método para cargar las noticias
  Future<void> loadTasks() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      tasksList = await _tasksService.getTasks();
    } catch (e) {
      errorMessage = 'Error al cargar las tareas.';
      print('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
