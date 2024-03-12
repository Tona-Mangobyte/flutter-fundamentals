import 'package:flutter/material.dart';
import 'dart:math';
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
      // body: _buildSimple(),
      // body: _buildAnimatedContainer(),
      // body: _buildAnimatedCrossFade(),
      // body: _buildAnimatedOpacity(),
      // body: _buildAnimatedSwitcher(),
      // body: _buildAnimatedPositioned(),
      body: _buildAnimatedSize(),
    );
  }

  Widget _buildSimple() {
    return CustomScrollView(
      // physics: CustomScrollPhysics(velocityFactor: 0.5),
      slivers: <Widget>[
        SliverAppBar(
          /*title: Text('SliverAppBar', style: TextStyle(color: Colors.blue)),
          centerTitle: true,*/
          //pinned: true, // This makes the AppBar sticky
          floating: true, // This should be false for a sticky AppBar
          snap: true, // This should be false for a sticky AppBar
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

  double _width = 50;
  double _height = 50;

  void _changeSize() {
    setState(() {
      _width = Random().nextDouble() * 200;
      _height = Random().nextDouble() * 200;
    });
  }

  Widget _buildAnimatedContainer() {
    return GestureDetector(
      onTap: _changeSize,
      child: AnimatedContainer(
        width: _width,
        height: _height,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        color: Colors.blue,
      ),
    );
  }

  bool _first = true;
  void _change() {
    setState(() {
      _first = !_first;
    });
  }
  Widget _buildAnimatedCrossFade() {
    return GestureDetector(
      onTap: _change,
      child: AnimatedCrossFade(
        duration: const Duration(seconds: 1),
        firstChild: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
        secondChild: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
        crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
    );
  }

  bool _visible = true;
  void _toggleOpacity() {
    setState(() {
      _visible = !_visible;
    });
  }
  Widget _buildAnimatedOpacity() {
    return GestureDetector(
      onTap: _toggleOpacity,
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: _visible ? 1.0 : 0.0,
        child: const FlutterLogo(size: 100),
      ),
    );
  }

  bool _showFirst = true;
  void _toggleChild() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }
  Widget _buildAnimatedSwitcher() {
    return GestureDetector(
      onTap: _toggleChild,
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        /*child: _showFirst
            ? const FlutterLogo(key: ValueKey(1), size: 100)
            : const FlutterLogo(key: ValueKey(2), size: 200),*/
        child: _showFirst
            ? Container(
          key: UniqueKey(),
          width: 100,
          height: 100,
          color: Colors.red,
        )
            : Container(
          key: UniqueKey(),
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
      ),
    );
  }

  bool _move = false;
  void _togglePosition() {
    setState(() {
      _move = !_move;
    });
  }
  Widget _buildAnimatedPositioned() {
    return GestureDetector(
      onTap: _togglePosition,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            top: _move ? 100 : 200,
            left: _move ? 100 : 200,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  bool _large = false;
  void _toggleSize() {
    setState(() {
      _large = !_large;
    });
  }
  Widget _buildAnimatedSize() {
    return GestureDetector(
      onTap: _toggleSize,
      child: Center(
        child: AnimatedSize(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: Container(
            width: _large ? 200 : 100,
            height: _large ? 200 : 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}