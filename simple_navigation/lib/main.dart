import 'package:flutter/material.dart';
import 'package:simple_navigation/screens/month/list.dart';
import 'package:simple_navigation/screens/simple_bottom.dart';
import 'package:simple_navigation/screens/simple_drawer.dart';
import 'package:simple_navigation/screens/simple_route.dart';
import 'package:simple_navigation/screens/simple_tab.dart';

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
      /*theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),*/
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
        ),
        primarySwatch: Colors.blue,
      ),
      // home: ListMonthScreen(),
      // home: const SimpleManageRoute(),
      // home: SimpleTabController(),
      // home: BottomNavigationBarScreen(),
      home: NavigationDrawerScreen(),
    );
  }
}
