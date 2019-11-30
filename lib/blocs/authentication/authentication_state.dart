import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState {
  AuthenticationState(this.displayName);
  
  final String displayName;

  // @override
  // List<Object> get props => [];

}

class Uninitialized extends AuthenticationState {
  Uninitialized(): super('');

  @override
  String toString() => 'Uninitialized';
}

class Authenticated extends AuthenticationState {
  Authenticated(displayName) : super(displayName);

  @override
  String toString() => 'Authenticated { displayName: $displayName }';
}

class Unauthenticated extends AuthenticationState {
  Unauthenticated(): super('');

  @override
  String toString() => 'Unauthenticated';
}
