import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            leading: Icon(Icons.menu),
            title: Text('MyAwesomeApp'),
            expandedHeight: 300,
            collapsedHeight: 150,
            floating: false,
          ),
          // Next, create a SliverList
          _MySliverList(item: _ListDataItems()),
        ], // End
      ),
    );
  }
}

class _MySliverList extends StatelessWidget {
  const _MySliverList({Key? key, required _ListDataItems this.item}) : super(key: key);

  final _ListDataItems item;

  @override
  Widget build(BuildContext context) {
    return // Next, create a SliverList
      SliverList(
        // Use a delegate to build items as they're scrolled on-screen.
        delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item.carItems[index].url),
            ),
            title: Text(item.carItems[index].title),
            subtitle: Text(item.carItems[index].subtitle),
          ),
          // Builds 1000 ListTiles
          childCount: item.carItems.length,
        ),
      );
  }
}
class _CarItem {
  final String title;
  final String subtitle;
  final String url;

  _CarItem({
    required this.title,
    required this.subtitle,
    required this.url,
  });
}

class _ListDataItems {
  final List<_CarItem> carItems = [
    _CarItem(
        title: '911 Cabriolet',
        subtitle: '911 Carrera Cabriolet Porsche',
        url:
        'https://oreil.ly/m3OXC'),
    _CarItem(
        title: '718 Spyder',
        subtitle: '718 Spyder Porsche',
        url:
        'https://oreil.ly/hca-6'),
    _CarItem(
        title: '718 Boxster T',
        subtitle: '718 Boxster T Porsche',
        url:
        'https://oreil.ly/Ws4EX'),
    _CarItem(
        title: 'Cayenne',
        subtitle: 'Cayenne S Porsche',
        url:
        'https://oreil.ly/gwvnL'),
    _CarItem(
        title: '911 Cabriolet',
        subtitle: '911 Carrera Cabriolet Porsche',
        url:
        'https://oreil.ly/m3OXC'),
    _CarItem(
        title: '718 Spyder',
        subtitle: '718 Spyder Porsche',
        url:
        'https://oreil.ly/hca-6'),
    _CarItem(
        title: '718 Boxster T',
        subtitle: '718 Boxster T Porsche',
        url:
        'https://oreil.ly/Ws4EX'),
    _CarItem(
        title: 'Cayenne',
        subtitle: 'Cayenne S Porsche',
        url:
        'https://oreil.ly/gwvnL'),
    _CarItem(
        title: '911 Cabriolet',
        subtitle: '911 Carrera Cabriolet Porsche',
        url:
        'https://oreil.ly/m3OXC'),
    _CarItem(
        title: '718 Spyder',
        subtitle: '718 Spyder Porsche',
        url:
        'https://oreil.ly/hca-6'),
    _CarItem(
        title: '718 Boxster T',
        subtitle: '718 Boxster T Porsche',
        url:
        'https://oreil.ly/Ws4EX'),
    _CarItem(
        title: 'Cayenne',
        subtitle: 'Cayenne S Porsche',
        url:
        'https://oreil.ly/gwvnL'),
  ];

   _ListDataItems();
}