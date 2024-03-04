import 'package:flutter/material.dart';

class ListViewActionPage extends StatelessWidget {
  const ListViewActionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'MyAwesomeApp';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: _MyListView(),
      ),
    );
  }
}

class _ListViewData {
  final List<String> monthItems = [
    'January',
    'February',
    'March',
  ];
}

class _MyListView extends StatelessWidget {
  _MyListView({Key? key}) : super(key: key);

  final _ListViewData items = _ListViewData();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.monthItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items.monthItems[index]),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('You selected ${items.monthItems[index]}'),
                ),
              );
            },
          );
        });
  }
}