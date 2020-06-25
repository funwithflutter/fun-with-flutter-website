import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/app_state/app_state_bloc.dart';
import 'application/authentication/authentication_bloc.dart';
import 'application/authentication/authentication_event.dart';
import 'application/authentication/login/login_bloc.dart';
import 'application/authentication/register/register_bloc.dart';
import 'application/blog/blog_bloc.dart';
import 'application/blog/blog_event.dart';
import 'application/filtered_blog/filtered_blog_bloc.dart';
import 'application/page/page_bloc.dart';
import 'application/simple_bloc_delegate.dart';
import 'infrastructure/blog/blog_repository.dart';
import 'infrastructure/blog/blog_service.dart';
import 'infrastructure/url_repository.dart'
    as url_repository;
import 'infrastructure/user_repository.dart';
import 'presentation/core/app_widget.dart';

void main() {
  assert(() {
    BlocSupervisor.delegate = SimpleBlocDelegate();
    return true;
  }());

  final UserRepository _userRepository = UserRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(create: (context) {
        return AuthenticationBloc(userRepository: _userRepository)
          ..add(AppStarted());
      }),
      BlocProvider<LoginBloc>(create: (context) {
        return LoginBloc(userRepository: _userRepository);
      }),
      BlocProvider<RegisterBloc>(
        create: (context) {
          return RegisterBloc(userRepository: _userRepository);
        },
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
      BlocProvider<PageBloc>(
        create: (context) {
          return PageBloc();
        }
      ),
      BlocProvider<AppStateBloc>(
        create: (contect) {
          return AppStateBloc();
        },
      )
    ],
    child: const MyApp(),
  ));
}