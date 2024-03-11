import 'package:flutter/material.dart';
import 'package:simple_network/services/article_service.dart';
import '../models/article.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late ArticleService _articleService;
  final List<Article> _articles = [];

  @override
  void initState() {
    super.initState();
    _articleService = ArticleService();
    print('HomeScreen initState called');
    _articleService.getArticles().then((articles) => {
      setState(() {
        _articles.addAll(articles);
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Network'),
      ),
      body: _buildArticleList(),
    );
  }

  Widget _buildArticleList() {
    return ListView.builder(
      itemCount: _articles.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(_articles[index].title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle: Text(_articles[index].body),
          ),
        );
      },
    );
  }
}