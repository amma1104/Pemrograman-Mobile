class BeritaModel {
  final String title;
  final String description;
  final String imageUrl;
  final String url;

  BeritaModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });

  factory BeritaModel.fromJson(Map<String, dynamic> json) {
    return BeritaModel(
      title: json['title'],
      description: json['description'],
      imageUrl: json['urlToImage'],
      url: json['url'],
    );
  }
}
