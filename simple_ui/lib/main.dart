import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_ui/pages/grid.dart';
import 'package:simple_ui/pages/grid2.dart';
import 'package:simple_ui/pages/home.dart';
import 'package:simple_ui/pages/list.dart';
import 'package:simple_ui/pages/list2.dart';
import 'package:simple_ui/pages/list3.dart';
import 'package:simple_ui/pages/local.dart';
import 'package:simple_ui/pages/login.dart';
import 'package:simple_ui/pages/profile.dart';
import 'package:simple_ui/pages/simple.dart';

void main() {
  runApp(const MyApp());
  // runApp(const MyCupertinoApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage(title: 'Flutter Demo Home Page'),
      // home: const GridViewPage(title: 'Grid View'),
      // home: const ListViewPage(title: 'List View'),
      // home: const SliverGridPage(title: 'Grid View'),
      // home: const SliverListPage(title: 'List View'),
      // home: const ListViewActionPage(),
      // home: const LoginPage(),
      // home: const SimplePage(),
      home: const ProfilePage(),
    );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter layout demo',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemGrey,
          middle: Text('Flutter layout demo'),
        ),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Hello World'),
            ],
          ),
        ),
      ),
    );
  }
}
