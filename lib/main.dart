import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
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
    BlocSupervisor.delegate = SimpleBlocDelegate();
    return true;
  }());

  runApp(AppInjector());
}

class AppInjector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserRepository _userRepository = UserRepository();

    return MultiBlocProvider(
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
          },
        ),
        BlocProvider<AppStateBloc>(
          create: (contect) {
            return AppStateBloc();
          },
        )
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
