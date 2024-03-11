import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/article.dart';

class ArticleState extends ChangeNotifier {
  late List<Article> _articles = [];
  late bool _loading = false;

  List<Article> get articles => _articles;

  void addArticles(List<Article> articles) {
    _articles.addAll(articles);
    print('ArticleState addArticles called');
    notifyListeners();
  }

  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}