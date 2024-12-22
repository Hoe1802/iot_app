// news_model.dart
class NewsModel {
  String? title;
  String? description;

  String? urlToImage;
  String? author;
  String? content;

  NewsModel({
    this.title,
    this.description,
    this.urlToImage,
    this.author,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      description: json['description'] ?? '',
      author: json['author'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
