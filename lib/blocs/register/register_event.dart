import 'package:meta/meta.dart';

@immutable
abstract class RegisterEvent {
  RegisterEvent();
}

class EmailChanged extends RegisterEvent {
  EmailChanged({@required this.email});

  final String email;

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends RegisterEvent {
  PasswordChanged({@required this.password});

  final String password;

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class Submitted extends RegisterEvent {
  Submitted({@required this.email, @required this.password});

  final String email;
  final String password;

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}