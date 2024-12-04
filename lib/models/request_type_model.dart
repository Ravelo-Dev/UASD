class RequestType {
  final String codigo;
  final String descripcion;

  RequestType({required this.codigo, required this.descripcion});

  factory RequestType.fromJson(Map<String, dynamic> json) {
    return RequestType(
      codigo: json['codigo'] ?? '',
      descripcion: json['descripcion'] ?? '',
    );
  }
}
