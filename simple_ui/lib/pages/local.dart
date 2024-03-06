import 'package:flutter/material.dart';

import '../common/app_localization.dart';

class AppLocalPage extends StatefulWidget {
  const AppLocalPage({Key? key}) : super(key: key);

  @override
  State<AppLocalPage> createState() => _AppLocalPageState();
}

class _AppLocalPageState extends State<AppLocalPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    const title = 'MyAwesomeApp';

    return MaterialApp(
      title: title,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email", // AppLocalizations.of(context)!.translate('email'),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password", // AppLocalizations.of(context)!.translate('password'),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  /*ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You clicked the login button'),
                    ),
                  );*/
                  print("Login process started...");
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}