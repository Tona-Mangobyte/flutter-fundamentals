import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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
    _articleState.setLoading(true);
    await Future.delayed(const Duration(seconds: 5));
    print('ArticleController getArticles called');
    _articleService.getArticles().then((articles) => {
      _articleState.addArticles(articles)
    });
    _articleState.setLoading(false);
  }
}
