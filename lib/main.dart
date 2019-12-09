import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/ui/app/app.dart';

import 'package:fun_with_flutter/blocs/register/bloc.dart';
import 'package:fun_with_flutter/repository/blog_repository.dart';
import 'package:fun_with_flutter/repository/url_repository.dart'
    as url_repository;
import 'package:fun_with_flutter/repository/user_repository.dart';
import 'package:fun_with_flutter/services/blog_service.dart';
import 'package:fun_with_flutter/themes.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/blocs/simple_bloc_delegate.dart';

import 'blocs/app_state/app_state_bloc.dart';

void main() {
  assert(() {
    if (fb.apps.isEmpty) {
      fb.initializeApp(
        apiKey: 'AIzaSyD8JoU_58xKlQFvva7nS7VHTKc1vUkaosk',
        authDomain: 'fun-with.firebaseapp.com',
        databaseURL: 'https://fun-with.firebaseio.com',
        projectId: 'fun-with',
        storageBucket: 'fun-with.appspot.com',
        messagingSenderId: '1006728819313',
      );
    }
    BlocSupervisor.delegate = SimpleBlocDelegate();
    return true;
  }());

  runApp(AppInjector());
}

class AppInjector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlogBloc _blogBloc = BlogBloc(
      blogRepository: BlogRepository(
        blogApi: BlogApi(uri: url_repository.blogDataUrl),
      ),
    );
    final UserRepository _userRepository = UserRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(builder: (context) {
          return AuthenticationBloc(userRepository: _userRepository)
            ..add(AppStarted());
        }),
        BlocProvider<LoginBloc>(builder: (context) {
          return LoginBloc(userRepository: _userRepository);
        }),
        BlocProvider<RegisterBloc>(
          builder: (context) {
            return RegisterBloc(userRepository: _userRepository);
          },
        ),
        BlocProvider<BlogBloc>(
          builder: (context) {
            return _blogBloc..add(Fetch());
          },
        ),
        BlocProvider<FilteredBlogBloc>(
          builder: (context) {
            return FilteredBlogBloc(blogBloc: _blogBloc);
          },
        ),
        BlocProvider<PageBloc>(
          builder: (context) {
            return PageBloc();
          },
        ),
        BlocProvider<AppStateBloc> (builder: (contect) {
          return AppStateBloc();
        },)
      ],
      child: MaterialApp(
        title: 'Fun with Flutter',
        theme: AppTheme.theme(),
        // initialRoute: '/', // Render Home page from initial route
        // onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        home: const App(),
      ),
    );
  }
}
