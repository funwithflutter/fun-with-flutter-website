import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState {
  const AuthenticationState(this.displayName);

  final String displayName;

  // @override
  // List<Object> get props => [];

}

class Uninitialized extends AuthenticationState {
  const Uninitialized() : super('');

  @override
  String toString() => 'Uninitialized';
}

class Authenticated extends AuthenticationState {
  const Authenticated(displayName) : super(displayName);

  @override
  String toString() => 'Authenticated { displayName: $displayName }';
}

class Unauthenticated extends AuthenticationState {
  const Unauthenticated() : super('');

  @override
  String toString() => 'Unauthenticated';
}
