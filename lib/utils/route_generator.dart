import 'package:flutter/material.dart';
import 'package:fun_with_flutter/ui/app/app.dart';
import 'package:fun_with_flutter/ui/pages/about/about_page.dart';
import 'package:fun_with_flutter/ui/pages/blog/blog_page.dart';
import 'package:fun_with_flutter/ui/pages/todo/todo_page.dart';

// TODO(gordon): use or remove
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
          builder: (_) => const App(),
        );
      case aboutRoute:
        return MaterialPageRoute(
          builder: (_) => AboutPage(),
        );
      case blogRoute:
        return MaterialPageRoute(
          builder: (_) => FilteredBlogPage(), // TODO(gordon): change this
        );
      case effectsRoute:
        return MaterialPageRoute(
          builder: (_) => TodoPage(),
        );
      case designRoute:
        return MaterialPageRoute(
          builder: (_) => TodoPage(),
        );
      case packagesRoute:
        return MaterialPageRoute(
          builder: (_) => TodoPage(),
        );
      case snippetsRoute:
        return MaterialPageRoute(
          builder: (_) => TodoPage(),
        );
      default:
        return _errorPage();
    }
  }

  static MaterialPageRoute _errorPage() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page does not exist'),
            ),
          ),
    );
  }
}
