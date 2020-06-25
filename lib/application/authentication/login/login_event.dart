part of 'login_bloc.dart';

@freezed
abstract class LoginEvent with _$LoginEvent{
  const factory LoginEvent.emailChanged({@required String email}) = EmailChanged;
  const factory LoginEvent.passwordChanged({@required String password}) = PasswordChanged;
  const factory LoginEvent.submitted({@required String email, @required String password}) = Submitted;
  const factory LoginEvent.loginWithGooglePressed() = LoginWithGooglePressed;
  const factory LoginEvent.loginWithCredentialsPressed({@required String email, @required String password}) = LoginWithCredentialsPressed;

}

// @immutable
// abstract class LoginEvent extends Equatable{
//   const LoginEvent();
// }

// class EmailChanged extends LoginEvent {
//   const EmailChanged({@required this.email});

//   final String email;

//   @override
//   String toString() => 'EmailChanged { email :$email }';

//   @override
//   List<Object> get props => [email];
// }

// class PasswordChanged extends LoginEvent {
//   const PasswordChanged({@required this.password});

//   final String password;

//   @override
//   String toString() => 'PasswordChanged { password: $password }';

//   @override
//   // TODO: implement props
//   List<Object> get props => throw UnimplementedError();
// }

// class Submitted extends LoginEvent {
//   const Submitted({@required this.email, @required this.password});

//   final String email;
//   final String password;

//   @override
//   String toString() {
//     return 'Submitted { email: $email, password: $password }';
//   }

//   @override
//   // TODO: implement props
//   List<Object> get props => throw UnimplementedError();
// }

// class LoginWithGooglePressed extends LoginEvent {
//   @override
//   String toString() => 'LoginWithGooglePressed';

//   @override
//   // TODO: implement props
//   List<Object> get props => throw UnimplementedError();
// }

// class LoginWithCredentialsPressed extends LoginEvent {
//   const LoginWithCredentialsPressed(
//       {@required this.email, @required this.password});

//   final String email;
//   final String password;

//   @override
//   String toString() {
//     return 'LoginWithCredentialsPressed { email: $email, password: $password }';
//   }

//   @override
//   // TODO: implement props
//   List<Object> get props => throw UnimplementedError();
// }
