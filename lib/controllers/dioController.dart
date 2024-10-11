import 'package:dio/dio.dart';
import '../models/article.dart';

class ArticleController {
  final Dio _dio = Dio();

  Future<List<Article>> fetchArticles() async {
    try {
      final response = await _dio.get('https://my-json-server.typicode.com/Fallid/codelab-api/db'); // Replace with your actual API endpoint

      if (response.statusCode == 200) {
        final data = response.data;

        // Access the 'articles' key inside the response
        List<dynamic> articlesData = data['articles'];

        // Map the articles data to the Article model
        return articlesData.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      throw Exception('Failed to load articles: $e');
    }
  }
}
