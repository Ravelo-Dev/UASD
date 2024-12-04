class Video {
  final int id;
  final String titulo;
  final String url;
  final String fechaPublicacion;

  Video({
    required this.id,
    required this.titulo,
    required this.url,
    required this.fechaPublicacion,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json['id'],
        titulo: json['titulo'],
        url: json['url'],
        fechaPublicacion: json['fechaPublicacion']);
  }
}
