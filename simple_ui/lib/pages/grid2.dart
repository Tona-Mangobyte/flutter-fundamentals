import 'package:flutter/material.dart';

class SliverGridPage extends StatelessWidget {
  const SliverGridPage({super.key, required this.title});

  final String title;
  final gridItems = 10;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: gridItems,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.blue,
                child: Center(child: Text((index + 1).toString())),
              ));
        });
  }
}