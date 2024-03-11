import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../services/article_service.dart';
import '../states/article_state.dart';

class ArticleController {

  ArticleController({required BuildContext context}) {
    print('ArticleController constructor called');
    _articleService = ArticleService();
    _articleState = Provider.of<ArticleState>(context, listen: false);
  }

  late ArticleService _articleService;
  late ArticleState _articleState;

  Future<void> getArticles() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _articleState.setLoading(true);
    });
    await Future.delayed(const Duration(seconds: 5));
    print('ArticleController getArticles called');
    _articleService.getArticles().then((articles) => {
      if(_articleState.hasListeners) {
        _articleState.addArticles(articles),
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          _articleState.setLoading(false);
        })
      }
      // _articleState.addArticles(articles)
    });
  }

  void dispose() {
    print('ArticleController dispose called');
    // _articleState.dispose();
  }
}
