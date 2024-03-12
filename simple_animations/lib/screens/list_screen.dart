import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<int> _items = [0, 1, 2, 3, 4];

  Widget _buildItem(BuildContext context, int index, animation) {
    int item = _items[index];

    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text('Item $item'),
        trailing: IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            _removeItem(index);
          },
        ),
      ),
    );
  }

  void _addItem() {
    int index = _items.length;
    _items.add(index);
    _listKey.currentState!.insertItem(index);
  }

  void _removeItem(int index) {
    int removedItem = _items.removeAt(index);
    AnimatedRemovedItemBuilder builder = (context, animation) {
      return _buildItem(context, removedItem, animation);
    };
    _listKey.currentState!.removeItem(index, builder);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedList'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(context, index, animation);
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _addItem,
            child: Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => _removeItem(_items.length - 1),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}