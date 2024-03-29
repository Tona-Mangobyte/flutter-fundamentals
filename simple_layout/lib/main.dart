import 'package:flutter/material.dart';
import 'package:simple_layout/screens/food/list_food.dart';
import 'package:simple_layout/screens/list_product2_screen.dart';
import 'package:simple_layout/screens/list_product_screen.dart';
import 'package:simple_layout/screens/profile_screen.dart';

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
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      // home: const ProfileScreen(),
      // home: const ListProductScreen(),
      // home: const ListProduct2Screen(),
      home: const ListFoodScreen(),
    );
  }
}
