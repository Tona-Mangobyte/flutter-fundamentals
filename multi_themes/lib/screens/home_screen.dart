import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.toggleTheme}) : super(key: key);
  final VoidCallback toggleTheme;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme, // Switch theme when the button is pressed
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is the home screen',
        ),
      ),
    );
  }
}