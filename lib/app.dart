import 'package:flutter/material.dart';
import 'package:fun_with_flutter/themes.dart';
import 'package:fun_with_flutter/ui/app/app.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fun with Flutter',
      theme: AppTheme.theme(),
      // initialRoute: '/', // Render Home page from initial route
      // onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      home: const App(),
    );
  }
}
