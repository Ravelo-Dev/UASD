class Debts {
  final int usuarioId; // Cambiado a int
  final double monto; // Cambiado a double
  final bool pagada;
  final String fechaActualizacion;

  Debts({
    required this.usuarioId,
    required this.monto,
    required this.pagada,
    required this.fechaActualizacion,
  });

  factory Debts.fromJson(Map<String, dynamic> json) {
    return Debts(
      usuarioId:
          json['usuarioId'] ?? 0, // Asignar un valor predeterminado si es null
      monto: (json['monto'] as num)
          .toDouble(), // Convertir a double para asegurar consistencia
      pagada: json['pagada'] ?? false,
      fechaActualizacion: json['fechaActualizacion'] ?? '',
    );
  }
}
