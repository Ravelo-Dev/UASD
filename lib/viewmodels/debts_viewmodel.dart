import 'package:flutter/material.dart';
import '../services/debts_service.dart';
import '../models/debts_model.dart';

class DebtsViewmodel extends ChangeNotifier {
  final DebtsService _debtsService = DebtsService();
  bool isLoading = false;
  String errorMessage = '';
  List<Debts> debtssList = [];

  // Método para cargar las noticias
  Future<void> loadDebts() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      debtssList = await _debtsService.getDebts();
    } catch (e) {
      errorMessage = 'Error al cargar las deudas.';
      print('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
