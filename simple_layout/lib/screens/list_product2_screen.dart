import 'package:flutter/material.dart';

class ListProduct2Screen extends StatefulWidget {
  const ListProduct2Screen({super.key});

  @override
  State<ListProduct2Screen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProduct2Screen> {
  bool _isLoading = false;

  Future<void> _refreshData() async {
    setState(() {
      _isLoading = true;
    });

    // Perform refresh operation here
    // This is just a dummy delay to simulate a real refresh operation
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Product'),
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            color: Colors.deepPurple,
            displacement: 40,
            strokeWidth: 3,
            onRefresh: _refreshData,
            child: _buildListView(),
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
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