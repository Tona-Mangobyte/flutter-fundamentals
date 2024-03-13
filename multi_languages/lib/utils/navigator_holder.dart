import 'package:flutter/material.dart';

class NavigatorHolder {
  factory NavigatorHolder() => _singleton;

  NavigatorHolder._internal();

  static final NavigatorHolder _singleton = NavigatorHolder._internal();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
