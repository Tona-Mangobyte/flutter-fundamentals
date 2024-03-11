import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_network/widgets/loading.dart';
import '../controllers/article_controller.dart';
import '../models/article.dart';
import '../states/article_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late ArticleController _articleController;

  @override
  void initState() {
    super.initState();
    print('HomeScreen initState called');
    _articleController = ArticleController(context: context);
    _articleController.getArticles();
  }

  @override
  void dispose() {
    super.dispose();
    print('HomeScreen dispose called');
    _articleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Network'),
      ),
      body: _buildArticleListProvider(),
    );
  }

  Widget _buildArticleListProvider() {
    return Consumer<ArticleState>(
      builder: (context, articleState, child) {
        if (articleState.loading) {
          return const Center(
            // child: Loading(),
            child: Text("Loading...", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
          );
        }
        return _buildArticleList(articleState.articles);
      },
    );
  }

  Widget _buildArticleList(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(articles[index].title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle: Text(articles[index].body, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
          ),
        );
      },
    );
  }
}