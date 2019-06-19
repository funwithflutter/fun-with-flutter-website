import 'package:bloc/bloc.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/repository/blog_repository.dart';

import 'package:fun_with_flutter/themes/styles.dart';
import 'package:fun_with_flutter/logic/route_generator.dart';

import 'blocs/bloc.dart';
import 'blocs/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final BlogBloc blogBloc = BlogBloc(blogRepository: BlogRepository());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: blogBloc..dispatch(Fetch()), //Load the Blog data
      child: BlocProviderTree(
        blocProviders: [
          BlocProvider<FilteredBlogBloc>(
            bloc: FilteredBlogBloc(blogBloc: blogBloc),
          ),
          BlocProvider<PageBloc>(
            bloc: PageBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Fun with Flutter',
          theme: theme,
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
