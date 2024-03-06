import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:simple_ui/pages/grid.dart';
import 'package:simple_ui/pages/grid2.dart';
import 'package:simple_ui/pages/home.dart';
import 'package:simple_ui/pages/list.dart';
import 'package:simple_ui/pages/list2.dart';
import 'package:simple_ui/pages/list3.dart';
import 'package:simple_ui/pages/local.dart';
import 'package:simple_ui/pages/login.dart';

import 'common/app_localization.dart';

void main() {
  runApp(const MyApp());
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
      home: const LoginPage(),
    );
  }
}
