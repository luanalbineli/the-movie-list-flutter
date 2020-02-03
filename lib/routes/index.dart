import 'package:flutter/material.dart';
import 'package:the_movie_list_flutter/screens/index.dart';

class AppRoutes {
  static const String routeResultOk = '#resultOk';
  static const String routeResultCancel = null;

  static MapEntry<String, WidgetBuilder> home;

  static Map<String, WidgetBuilder> getRoutes() {
    home = MapEntry('/home', (context) => HomeScreen());

    Map<String, WidgetBuilder> routes = {};
    routes.addEntries([
      home
    ]);

    return routes;
  }

}