import 'package:flutter/material.dart';
import 'package:simple_animations/utils/custom_physics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: _buildSimple(),
    );
  }

  Widget _buildSimple() {
    return CustomScrollView(
      // physics: CustomScrollPhysics(velocityFactor: 0.5),
      slivers: <Widget>[
        SliverAppBar(
          // title: Text('Simple SliverAppBar'),
          pinned: true, // This makes the AppBar sticky
          floating: false, // This should be false for a sticky AppBar
          snap: false, // This should be false for a sticky AppBar
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset('assets/images/pic6.jpg',fit: BoxFit.cover),
            centerTitle: true,
            title: const Text('Home Screen',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
            childCount: 100,
          ),
        ),
      ],
    );
  }
}