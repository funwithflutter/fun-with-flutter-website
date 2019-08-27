import 'package:bloc/bloc.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/dataprovider/blog_data_provider.dart';
import 'package:fun_with_flutter/repository/blog_repository.dart';
import 'package:fun_with_flutter/themes.dart';

import 'package:fun_with_flutter/logic/route_generator.dart';
import 'package:fun_with_flutter/repository/url_repository.dart';

import 'blocs/bloc.dart';
import 'blocs/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String uri = blogDataUrl;
    final BlogBloc blogBloc = BlogBloc(
      blogRepository: BlogRepository(
        blogDataProvider: BlogDataProvider(uri),
      ),
    );

    return BlocProvider(
      builder: (context) {
        return blogBloc..dispatch(Fetch());
      }, //Load the Blog data
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FilteredBlogBloc>(
            builder: (context) {
              return FilteredBlogBloc(blogBloc: blogBloc);
            },
          ),
          BlocProvider<PageBloc>(
            builder: (context) {
              return PageBloc();
            },
          )
        ],
        child: MaterialApp(
          title: 'Fun with Flutter',
          theme: AppTheme.theme(),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
