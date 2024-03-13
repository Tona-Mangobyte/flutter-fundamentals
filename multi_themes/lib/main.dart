import 'package:flutter/material.dart';
import 'package:multi_themes/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Define your themes
   ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.red,
  );

  // Create a state variable to hold the current theme. Default is light.
   ThemeData? currentTheme;

  @override
  void initState() {
    super.initState();
    currentTheme = lightTheme;
  }

  // Function to toggle the theme
  void toggleTheme() {
    setState(() {
      currentTheme = (currentTheme == lightTheme) ? darkTheme : lightTheme;
    });
    print('Theme has been changed to: $currentTheme');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      home: HomeScreen(toggleTheme: toggleTheme),
    );
  }

}
