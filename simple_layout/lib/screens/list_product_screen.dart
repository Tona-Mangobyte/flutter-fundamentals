import 'package:flutter/material.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});

  Future<void> _refreshData() async {
    // Perform refresh operation here
    // This is just a dummy delay to simulate a real refresh operation
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Product'),
      ),
      body: RefreshIndicator(
        color: Colors.red,
        displacement: 40,
        strokeWidth: 3,
        onRefresh: _refreshData,
        child: _buildListView(),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        final int itemIndex = index + 1;
        return ListTile(
          leading: Stack(
            children: [
              Image.asset('assets/images/pic$index.jpg', height: 200),
            ]
          ),
          title: Text('Product $itemIndex'),
          subtitle: Text('Description of Product $itemIndex'),
          // trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            print('Product $index');
          },
        );
      },
    );
  }
}
