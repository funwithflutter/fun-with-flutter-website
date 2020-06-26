import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routes/router.gr.dart';
import '../themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fun with Flutter',
      theme: AppTheme.theme(),
      builder: ExtendedNavigator(router: Router()),
      debugShowCheckedModeBanner: false,
    );
  }
}
