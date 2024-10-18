class BeritanullModel {
  final String title;
  final String description;
  final String imageUrl;
  final String url;

  BeritanullModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });

  factory BeritanullModel.fromJson(Map<String, dynamic> json) {
    return BeritanullModel(
      title: json['title'],
      description: json['description'],
      imageUrl: json['urlToImage'],
      url: json['url'],
    );
  }
}
