import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Components"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => _buildShowDialog(context),
                child: const Text("Dialog #1"),
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => _buildShowDialog(context),
                child: const Text("Dialog #2"),
              ),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => _buildShowDialog(context),
                child: const Text("Dialog #3"),
              )
            ],
          )
        ]
      ),
    );
  }

  Future<void> _buildShowDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text(
            'A dialog is a type of modal window that\n'
                'appears in front of app content to\n'
                'provide critical information, or prompt\n'
                'for a decision to be made.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}