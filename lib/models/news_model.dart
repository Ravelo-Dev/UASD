class News {
  final String id;
  final String title;
  final String img;
  final String url;
  final String date;

  News({
    required this.id,
    required this.title,
    required this.img,
    required this.url,
    required this.date,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      img: json['img'],
      url: json['url'],
      date: json['date'],
    );
  }
}
