

import 'package:bloc_udemy/core/app_strings.dart';

class NewsModel {
  final String? title;
  final String? author;
  final String? urlToImage;
  final String? publishedAt;
  final String? description;

  // Constructeur principal
  NewsModel({
    this.title,
    this.author,
    this.urlToImage,
    this.publishedAt,
    this.description,
  });

  // Constructeur à partir d'une Map (pour JSON)
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? "",
      author: json['author'] ?? "",
      urlToImage: json['urlToImage'] ?? AppStrings.defaultImage,
      publishedAt: json['publishedAt'] ?? "",
      description: json['description'] ?? "",
    );
  }

  // Convertir en Map (pour JSON)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'description': description,
    };
  }

  // Méthode copyWith pour créer une copie modifiée
  NewsModel copyWith({
    String? title,
    String? author,
    String? urlToImage,
    String? publishedAt,
    String? description,
  }) {
    return NewsModel(
      title: title ?? this.title,
      author: author ?? this.author,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'NewsModel(title: $title, author: $author, urlToImage: $urlToImage, publishedAt: $publishedAt, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsModel &&
        other.title == title &&
        other.author == author &&
        other.urlToImage == urlToImage &&
        other.publishedAt == publishedAt &&
        other.description == description;
  }

  @override
  int get hashCode {
    return title.hashCode ^
    author.hashCode ^
    urlToImage.hashCode ^
    publishedAt.hashCode ^
    description.hashCode;
  }
}