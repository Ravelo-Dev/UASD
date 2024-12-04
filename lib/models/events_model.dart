class EventsModel {
  final int id;
  final String titulo;
  final String descripcion;
  final String fechaEvento;
  final String lugar;
  final String coordenadas;

  EventsModel(
      {required this.id,
      required this.titulo,
      required this.descripcion,
      required this.fechaEvento,
      required this.lugar,
      required this.coordenadas});

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
        id: json['id'] ?? 0,
        titulo: json['titulo'],
        descripcion: json['descripcion'],
        fechaEvento: json['fechaEvento'],
        lugar: json['lugar'],
        coordenadas: json['coordenadas']);
  }
}
