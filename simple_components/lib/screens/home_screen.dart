import 'package:flutter/material.dart';
import 'package:simple_components/screens/simple_components_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _itemSelected = 0;

  void _bottomBarNavigation(int index) {
    setState(() {
      _itemSelected = index;
    });
  }

  final List<Widget> _navigationScreens = [
    const SimpleComponents(),
    const Center(child: Text('Page: Products')),
    const Center(child: Text('Demo: Favorites')),
    const Center(child: Text('Demo: List')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: _navigationScreens[_itemSelected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _itemSelected,
        onTap: _bottomBarNavigation,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopify), label: 'Products'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
        ],
      ),
    );
  }
}
