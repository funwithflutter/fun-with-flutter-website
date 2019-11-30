import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {
  LoginEvent();
}

class EmailChanged extends LoginEvent {
  EmailChanged({@required this.email});

  final String email;

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends LoginEvent {
  PasswordChanged({@required this.password});
  
  final String password;


  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class Submitted extends LoginEvent {
  Submitted({@required this.email, @required this.password});
  
  final String email;
  final String password;


  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}

class LoginWithGooglePressed extends LoginEvent {
  @override
  String toString() => 'LoginWithGooglePressed';
}

class LoginWithCredentialsPressed extends LoginEvent {
  LoginWithCredentialsPressed({@required this.email, @required this.password});

  final String email;
  final String password;

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, password: $password }';
  }
}
