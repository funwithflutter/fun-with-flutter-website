import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/ui/widgets/error/error_widget.dart';
import 'package:fun_with_flutter/ui/widgets/login/login_form.dart';
import 'package:fun_with_flutter/ui/widgets/register/register_form.dart';

enum RegistrationState { login, register }

class AccountPage extends StatefulWidget {

  const AccountPage();

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is Unauthenticated) {
        return _SignInSignUp();
      }
      if (state is Authenticated) {
        return FlatButton(
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          },
          child: const Text('Sign out'),
        );
      }
      return const CustomError(
        errorMessage: 'Auth not initialised',
      );
    });
  }
}

class _SignInSignUp extends StatefulWidget {
  @override
  __SignInSignUpState createState() => __SignInSignUpState();
}

class __SignInSignUpState extends State<_SignInSignUp> {
  RegistrationState _registrationState = RegistrationState.login;

  void _changeAccountStateToRegister() {
    setState(() {
      _registrationState = RegistrationState.register;
    });
  }

  void _changeAccountStateToLogin() {
    setState(() {
      _registrationState = RegistrationState.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        if (_registrationState == RegistrationState.login) LoginForm(),
        if (_registrationState == RegistrationState.register) RegisterForm(),
        if (_registrationState == RegistrationState.login)
          FlatButton(
            onPressed: _changeAccountStateToRegister,
            child: const Text("Don't have an account?"),
          ),
        if (_registrationState == RegistrationState.register)
          FlatButton(
            onPressed: _changeAccountStateToLogin,
            child: const Text('Back to login.'),
          ),
      ],
    );
  }
}
