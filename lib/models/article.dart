class Article {
  final int id;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content
  });

factory Article.fromJson(Map<String, dynamic> json) {
  return Article(
    id: json['id'],
    author: json['author'] ?? 'Unknown Author',
    title: json['title'],
    description: json['description'],
    url: json['url'],
    urlToImage: json['urlToImage'] ?? '',
    publishedAt: json['publishedAt'],
    content: json['content'] ?? '',
    );
  }
}