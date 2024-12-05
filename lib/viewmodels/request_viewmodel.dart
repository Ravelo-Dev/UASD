import 'package:flutter/material.dart';
import '../models/request_type_model.dart';
import '../models/request_model.dart';
import '../services/request_service.dart';

class SolicitudesViewModel extends ChangeNotifier {
  final SolicitudesService _solicitudesService = SolicitudesService();

  List<RequestType> tiposSolicitudes = [];
  List<RequestModel> misSolicitudes = [];
  bool isLoading = false;
  String errorMessage = '';

  void _safeNotifyListeners() {
    if (hasListeners) {
      notifyListeners();
    }
  }

  Future<void> cargarTiposSolicitudes() async {
    if (isLoading) return;
    try {
      isLoading = true;
      _safeNotifyListeners();
      tiposSolicitudes = await _solicitudesService.getTiposSolicitudes();
    } catch (e) {
      errorMessage = 'Error al cargar los tipos de solicitudes.';
    } finally {
      isLoading = false;
      _safeNotifyListeners();
    }
  }

  Future<void> cargarMisSolicitudes() async {
    if (isLoading) return; // Evita múltiples llamadas simultáneas
    try {
      isLoading = true;
      _safeNotifyListeners(); // Notifica el inicio de la carga
      misSolicitudes = await _solicitudesService.getMisSolicitudes();
      print(
          'Solicitudes cargadas: ${misSolicitudes.length}'); // Verifica los datos
      errorMessage = ''; // Limpia cualquier mensaje de error previo
    } catch (e) {
      errorMessage = 'Error al cargar tus solicitudes.';
      print('Error: $e');
    } finally {
      isLoading = false;
      _safeNotifyListeners(); // Notifica los cambios en los datos
    }
  }

  Future<void> crearSolicitud(String tipo, String descripcion) async {
    try {
      await _solicitudesService.crearSolicitud(tipo, descripcion);
      await cargarMisSolicitudes(); // Refrescar lista
    } catch (e) {
      errorMessage = 'Error al crear la solicitud.';
    }
  }
}
