import 'package:dio/dio.dart';
import 'dart:async';
import '../mixins/network_traffic.dart';
import '../models/article.dart';

class ArticleService with NetworkTraffic {
  ArticleService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
      ),
    );
    // _dio.interceptors.add(LogInterceptor(responseBody: true));
  }
  late Dio _dio;

  Future<List<Article>> getArticles() async {
    print('ArticleService getArticles called');
    return await _dio.get('/posts', onReceiveProgress: onReceiveProgress)
        .then((value) => convertData(value))
        .whenComplete(() => whenComplete());
  }

  List<Article> convertData(Response<dynamic> response) {
    final List<Article> articles = [];
    for (var json in response.data) {
      articles.add(Article.fromJson(json));
    }
    return articles;
  }
}