import 'package:dio/dio.dart';
import 'dart:async';
import '../models/article.dart';

class ArticleService {
  final Dio _dio = Dio();

  Future<List<Article>> getArticles() async {
    print('ArticleService getArticles called');
    final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
    final List<Article> articles = [];
    for (var json in response.data) {
      articles.add(Article.fromJson(json));
    }
    print('ArticleService getArticles returned count ${articles.length} articles');
    return articles;
  }
}