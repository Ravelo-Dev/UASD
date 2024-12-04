class TasksModel {
  final int id;
  final int usuarioId;
  final String titulo;
  final String descripcion;
  final String fechaVencimiento;
  final bool completada;

  TasksModel(
      {required this.id,
      required this.usuarioId,
      required this.titulo,
      required this.descripcion,
      required this.fechaVencimiento,
      required this.completada});

  factory TasksModel.fromJson(Map<String, dynamic> json) {
    return TasksModel(
        id: json['id'] ?? 0,
        usuarioId: json['usuarioId'] ?? 0,
        titulo: json['titulo'] ?? '',
        descripcion: json['descripcion'] ?? '',
        fechaVencimiento: json['fechaVencimiento'] ?? '',
        completada: json['completada'] ?? false);
  }
}
