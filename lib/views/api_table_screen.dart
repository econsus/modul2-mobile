import 'package:flutter/material.dart';
import '../controllers/dioController.dart';
import '../models/article.dart';

class ApiTableScreen extends StatefulWidget {
  const ApiTableScreen({Key? key}) : super(key: key);

  @override
  _ApiTableScreenState createState() => _ApiTableScreenState();
}

class _ApiTableScreenState extends State<ApiTableScreen> {
  final ArticleController _articleController = ArticleController();
  late Future<List<Article>> _futureArticles;

  @override
  void initState() {
    super.initState();
    _futureArticles = _articleController.fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Article Data Table'),
      ),
      body: FutureBuilder<List<Article>>(
        future: _futureArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Article> articles = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Author')),
                  DataColumn(label: Text('Title')),
                  DataColumn(label: Text('Published At')),
                  DataColumn(label: Text('Description')),
                ],
                rows: articles
                    .map((article) => DataRow(cells: [
                          DataCell(Text(article.id.toString())),
                          DataCell(Text(article.author)),
                          DataCell(Text(article.title)),
                          DataCell(Text(article.publishedAt)),
                          DataCell(Text(article.description)),
                        ]))
                    .toList(),
              ),
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
