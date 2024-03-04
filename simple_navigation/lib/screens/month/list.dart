import 'package:flutter/material.dart';

import 'detail.dart';

class ListMonthScreen extends StatelessWidget {
  ListMonthScreen({Key? key}) : super(key: key);

  final List<String> items = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    const title = 'MyAwesomeApp';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return _MyListView(items[index]);
          },
        ),
      ),
    );
  }
}

class _MyListView extends StatelessWidget {

  const _MyListView(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MonthScreenDetails(title),
          ),
        );
      },
    );
  }
}