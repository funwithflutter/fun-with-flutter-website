import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'blocs/app_state/app_state_bloc.dart';
import 'blocs/bloc.dart';
import 'blocs/register/bloc.dart';
import 'blocs/simple_bloc_delegate.dart';
import 'repository/blog_repository.dart';
import 'repository/url_repository.dart'
    as url_repository;
import 'repository/user_repository.dart';
import 'services/blog_service.dart';

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