import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/login/bloc.dart';
import 'package:fun_with_flutter/repository/user_repository.dart';

import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    print('build method called');
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider<LoginBloc>(
        builder: (context) => LoginBloc(userRepository: _userRepository),
        child: LoginForm(userRepository: _userRepository),
      ),
    );
  }
}
