class RequestModel {
  final String tipo;
  final String descripcion;

  RequestModel({required this.tipo, required this.descripcion});

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      tipo: json['tipo'] ?? '',
      descripcion: json['descripcion'] ?? '',
    );
  }
}
