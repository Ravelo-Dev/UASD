class Seepreselection {
  final String codigo;
  final String nombre;
  final String aula;
  final String? ubicacion; // Campo opcional
  final bool confirmada;

  Seepreselection({
    required this.codigo,
    required this.nombre,
    required this.aula,
    this.ubicacion, // No requerido
    required this.confirmada,
  });

  factory Seepreselection.fromJson(Map<String, dynamic> json) {
    return Seepreselection(
      codigo: json['codigo'] ?? '', // Valor predeterminado si es nulo
      nombre: json['nombre'] ?? '',
      aula: json['aula'] ?? '',
      ubicacion: json['ubicacion'], // Permitir nulo
      confirmada:
          json['confirmada'] ?? false, // Predeterminado a `false` si es nulo
    );
  }
}
