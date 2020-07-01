import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/theme/bloc/theme_bloc.dart';
import '../routes/router.gr.dart';
import 'themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Fun with Flutter',
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: state.map(
            light: (_) => ThemeMode.light,
            dark: (_) => ThemeMode.dark,
          ),
          builder: ExtendedNavigator(router: Router()),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
