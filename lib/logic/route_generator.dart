import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/screens/about/about_screen.dart';
import 'package:fun_with_flutter/screens/blog/blog_screen.dart';
import 'package:fun_with_flutter/screens/home/home_screen.dart';
import 'package:fun_with_flutter/screens/todo/todo_screen.dart';

class RouteGenerator {
  static const String homeRoute = '/';
  static const String aboutRoute = '/about';
  static const String blogRoute = '/blog';
  static const String effectsRoute = '/effects';
  static const String designRoute = '/design';
  static const String packagesRoute = '/packages';
  static const String snippetsRoute = '/snippets';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case aboutRoute:
        return MaterialPageRoute(
          builder: (_) => AboutScreen(),
        );
      case blogRoute:
        return MaterialPageRoute(
          builder: (_) => BlogScreen(),
        );
      case effectsRoute:
        return MaterialPageRoute(
          builder: (_) => TodoScreen(),
        );
      case designRoute:
        return MaterialPageRoute(
          builder: (_) => TodoScreen(),
        );
      case packagesRoute:
        return MaterialPageRoute(
          builder: (_) => TodoScreen(),
        );
      case snippetsRoute:
        return MaterialPageRoute(
          builder: (_) => TodoScreen(),
        );
      default:
        return _errorPage();
    }
  }

  static MaterialPageRoute _errorPage() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
            body: const Center(
              child: Text('Page does not exist'),
            ),
          ),
    );
  }
}
