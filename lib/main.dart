import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'application/auth/auth_bloc.dart';
import 'application/blog/blog_bloc.dart';
import 'application/blog/blog_event.dart';
import 'application/filtered_blog/filtered_blog_bloc.dart';
import 'application/page/page_bloc.dart';
import 'application/simple_bloc_delegate.dart';
import 'infrastructure/blog/blog_repository.dart';
import 'infrastructure/blog/blog_service.dart';
import 'infrastructure/url_repository.dart' as url_repository;
import 'injection.dart';
import 'presentation/core/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  assert(() {
    BlocSupervisor.delegate = SimpleBlocDelegate();
    return true;
  }());

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) =>
            getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
      ),
      BlocProvider<BlogBloc>(
        create: (context) {
          return BlogBloc(
            blogRepository: BlogRepository(
              blogApi: BlogApi(uri: url_repository.blogDataUrl),
            ),
          )..add(Fetch());
        },
      ),
      BlocProvider<FilteredBlogBloc>(
        create: (context) {
          return FilteredBlogBloc(blogBloc: BlocProvider.of<BlogBloc>(context));
        },
      ),
      BlocProvider<PageBloc>(create: (context) {
        return PageBloc();
      }),
    ],
    child: const MyApp(),
  ));
}
