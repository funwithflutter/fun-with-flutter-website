// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LoginEventTearOff {
  const _$LoginEventTearOff();

  EmailChanged emailChanged({@required String email}) {
    return EmailChanged(
      email: email,
    );
  }

  PasswordChanged passwordChanged({@required String password}) {
    return PasswordChanged(
      password: password,
    );
  }

  Submitted submitted({@required String email, @required String password}) {
    return Submitted(
      email: email,
      password: password,
    );
  }

  LoginWithGooglePressed loginWithGooglePressed() {
    return const LoginWithGooglePressed();
  }

  LoginWithCredentialsPressed loginWithCredentialsPressed(
      {@required String email, @required String password}) {
    return LoginWithCredentialsPressed(
      email: email,
      password: password,
    );
  }
}

// ignore: unused_element
const $LoginEvent = _$LoginEventTearOff();

mixin _$LoginEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result submitted(String email, String password),
    @required Result loginWithGooglePressed(),
    @required Result loginWithCredentialsPressed(String email, String password),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result submitted(String email, String password),
    Result loginWithGooglePressed(),
    Result loginWithCredentialsPressed(String email, String password),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result submitted(Submitted value),
    @required Result loginWithGooglePressed(LoginWithGooglePressed value),
    @required
        Result loginWithCredentialsPressed(LoginWithCredentialsPressed value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result submitted(Submitted value),
    Result loginWithGooglePressed(LoginWithGooglePressed value),
    Result loginWithCredentialsPressed(LoginWithCredentialsPressed value),
    @required Result orElse(),
  });
}

abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res>;
}

class _$LoginEventCopyWithImpl<$Res> implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  final LoginEvent _value;
  // ignore: unused_field
  final $Res Function(LoginEvent) _then;
}

abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

class _$EmailChangedCopyWithImpl<$Res> extends _$LoginEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(EmailChanged(
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged({@required this.email}) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'LoginEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result submitted(String email, String password),
    @required Result loginWithGooglePressed(),
    @required Result loginWithCredentialsPressed(String email, String password),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    assert(loginWithGooglePressed != null);
    assert(loginWithCredentialsPressed != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result submitted(String email, String password),
    Result loginWithGooglePressed(),
    Result loginWithCredentialsPressed(String email, String password),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result submitted(Submitted value),
    @required Result loginWithGooglePressed(LoginWithGooglePressed value),
    @required
        Result loginWithCredentialsPressed(LoginWithCredentialsPressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    assert(loginWithGooglePressed != null);
    assert(loginWithCredentialsPressed != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result submitted(Submitted value),
    Result loginWithGooglePressed(LoginWithGooglePressed value),
    Result loginWithCredentialsPressed(LoginWithCredentialsPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements LoginEvent {
  const factory EmailChanged({@required String email}) = _$EmailChanged;

  String get email;
  $EmailChangedCopyWith<EmailChanged> get copyWith;
}

abstract class $PasswordChangedCopyWith<$Res> {
  factory $PasswordChangedCopyWith(
          PasswordChanged value, $Res Function(PasswordChanged) then) =
      _$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String password});
}

class _$PasswordChangedCopyWithImpl<$Res> extends _$LoginEventCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(
      PasswordChanged _value, $Res Function(PasswordChanged) _then)
      : super(_value, (v) => _then(v as PasswordChanged));

  @override
  PasswordChanged get _value => super._value as PasswordChanged;

  @override
  $Res call({
    Object password = freezed,
  }) {
    return _then(PasswordChanged(
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged({@required this.password}) : assert(password != null);

  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @override
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result submitted(String email, String password),
    @required Result loginWithGooglePressed(),
    @required Result loginWithCredentialsPressed(String email, String password),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    assert(loginWithGooglePressed != null);
    assert(loginWithCredentialsPressed != null);
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result submitted(String email, String password),
    Result loginWithGooglePressed(),
    Result loginWithCredentialsPressed(String email, String password),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result submitted(Submitted value),
    @required Result loginWithGooglePressed(LoginWithGooglePressed value),
    @required
        Result loginWithCredentialsPressed(LoginWithCredentialsPressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    assert(loginWithGooglePressed != null);
    assert(loginWithCredentialsPressed != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result submitted(Submitted value),
    Result loginWithGooglePressed(LoginWithGooglePressed value),
    Result loginWithCredentialsPressed(LoginWithCredentialsPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements LoginEvent {
  const factory PasswordChanged({@required String password}) =
      _$PasswordChanged;

  String get password;
  $PasswordChangedCopyWith<PasswordChanged> get copyWith;
}

abstract class $SubmittedCopyWith<$Res> {
  factory $SubmittedCopyWith(Submitted value, $Res Function(Submitted) then) =
      _$SubmittedCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

class _$SubmittedCopyWithImpl<$Res> extends _$LoginEventCopyWithImpl<$Res>
    implements $SubmittedCopyWith<$Res> {
  _$SubmittedCopyWithImpl(Submitted _value, $Res Function(Submitted) _then)
      : super(_value, (v) => _then(v as Submitted));

  @override
  Submitted get _value => super._value as Submitted;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(Submitted(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

class _$Submitted implements Submitted {
  const _$Submitted({@required this.email, @required this.password})
      : assert(email != null),
        assert(password != null);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.submitted(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Submitted &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  $SubmittedCopyWith<Submitted> get copyWith =>
      _$SubmittedCopyWithImpl<Submitted>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result submitted(String email, String password),
    @required Result loginWithGooglePressed(),
    @required Result loginWithCredentialsPressed(String email, String password),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    assert(loginWithGooglePressed != null);
    assert(loginWithCredentialsPressed != null);
    return submitted(email, password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result submitted(String email, String password),
    Result loginWithGooglePressed(),
    Result loginWithCredentialsPressed(String email, String password),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (submitted != null) {
      return submitted(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result submitted(Submitted value),
    @required Result loginWithGooglePressed(LoginWithGooglePressed value),
    @required
        Result loginWithCredentialsPressed(LoginWithCredentialsPressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    assert(loginWithGooglePressed != null);
    assert(loginWithCredentialsPressed != null);
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result submitted(Submitted value),
    Result loginWithGooglePressed(LoginWithGooglePressed value),
    Result loginWithCredentialsPressed(LoginWithCredentialsPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class Submitted implements LoginEvent {
  const factory Submitted({@required String email, @required String password}) =
      _$Submitted;

  String get email;
  String get password;
  $SubmittedCopyWith<Submitted> get copyWith;
}

abstract class $LoginWithGooglePressedCopyWith<$Res> {
  factory $LoginWithGooglePressedCopyWith(LoginWithGooglePressed value,
          $Res Function(LoginWithGooglePressed) then) =
      _$LoginWithGooglePressedCopyWithImpl<$Res>;
}

class _$LoginWithGooglePressedCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $LoginWithGooglePressedCopyWith<$Res> {
  _$LoginWithGooglePressedCopyWithImpl(LoginWithGooglePressed _value,
      $Res Function(LoginWithGooglePressed) _then)
      : super(_value, (v) => _then(v as LoginWithGooglePressed));

  @override
  LoginWithGooglePressed get _value => super._value as LoginWithGooglePressed;
}

class _$LoginWithGooglePressed implements LoginWithGooglePressed {
  const _$LoginWithGooglePressed();

  @override
  String toString() {
    return 'LoginEvent.loginWithGooglePressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoginWithGooglePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result submitted(String email, String password),
    @required Result loginWithGooglePressed(),
    @required Result loginWithCredentialsPressed(String email, String password),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    assert(loginWithGooglePressed != null);
    assert(loginWithCredentialsPressed != null);
    return loginWithGooglePressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result submitted(String email, String password),
    Result loginWithGooglePressed(),
    Result loginWithCredentialsPressed(String email, String password),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithGooglePressed != null) {
      return loginWithGooglePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result submitted(Submitted value),
    @required Result loginWithGooglePressed(LoginWithGooglePressed value),
    @required
        Result loginWithCredentialsPressed(LoginWithCredentialsPressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    assert(loginWithGooglePressed != null);
    assert(loginWithCredentialsPressed != null);
    return loginWithGooglePressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result submitted(Submitted value),
    Result loginWithGooglePressed(LoginWithGooglePressed value),
    Result loginWithCredentialsPressed(LoginWithCredentialsPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithGooglePressed != null) {
      return loginWithGooglePressed(this);
    }
    return orElse();
  }
}

abstract class LoginWithGooglePressed implements LoginEvent {
  const factory LoginWithGooglePressed() = _$LoginWithGooglePressed;
}

abstract class $LoginWithCredentialsPressedCopyWith<$Res> {
  factory $LoginWithCredentialsPressedCopyWith(
          LoginWithCredentialsPressed value,
          $Res Function(LoginWithCredentialsPressed) then) =
      _$LoginWithCredentialsPressedCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

class _$LoginWithCredentialsPressedCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $LoginWithCredentialsPressedCopyWith<$Res> {
  _$LoginWithCredentialsPressedCopyWithImpl(LoginWithCredentialsPressed _value,
      $Res Function(LoginWithCredentialsPressed) _then)
      : super(_value, (v) => _then(v as LoginWithCredentialsPressed));

  @override
  LoginWithCredentialsPressed get _value =>
      super._value as LoginWithCredentialsPressed;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(LoginWithCredentialsPressed(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

class _$LoginWithCredentialsPressed implements LoginWithCredentialsPressed {
  const _$LoginWithCredentialsPressed(
      {@required this.email, @required this.password})
      : assert(email != null),
        assert(password != null);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.loginWithCredentialsPressed(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginWithCredentialsPressed &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  $LoginWithCredentialsPressedCopyWith<LoginWithCredentialsPressed>
      get copyWith => _$LoginWithCredentialsPressedCopyWithImpl<
          LoginWithCredentialsPressed>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result submitted(String email, String password),
    @required Result loginWithGooglePressed(),
    @required Result loginWithCredentialsPressed(String email, String password),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    assert(loginWithGooglePressed != null);
    assert(loginWithCredentialsPressed != null);
    return loginWithCredentialsPressed(email, password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result submitted(String email, String password),
    Result loginWithGooglePressed(),
    Result loginWithCredentialsPressed(String email, String password),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithCredentialsPressed != null) {
      return loginWithCredentialsPressed(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result submitted(Submitted value),
    @required Result loginWithGooglePressed(LoginWithGooglePressed value),
    @required
        Result loginWithCredentialsPressed(LoginWithCredentialsPressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    assert(loginWithGooglePressed != null);
    assert(loginWithCredentialsPressed != null);
    return loginWithCredentialsPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result submitted(Submitted value),
    Result loginWithGooglePressed(LoginWithGooglePressed value),
    Result loginWithCredentialsPressed(LoginWithCredentialsPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithCredentialsPressed != null) {
      return loginWithCredentialsPressed(this);
    }
    return orElse();
  }
}

abstract class LoginWithCredentialsPressed implements LoginEvent {
  const factory LoginWithCredentialsPressed(
      {@required String email,
      @required String password}) = _$LoginWithCredentialsPressed;

  String get email;
  String get password;
  $LoginWithCredentialsPressedCopyWith<LoginWithCredentialsPressed>
      get copyWith;
}

class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  _LoginState call(
      {@required bool isEmailValid,
      @required bool isPasswordValid,
      @required bool isSubmitting,
      @required bool isSuccess,
      @required bool isFailure,
      String errorMessage = ''}) {
    return _LoginState(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      isFailure: isFailure,
      errorMessage: errorMessage,
    );
  }
}

// ignore: unused_element
const $LoginState = _$LoginStateTearOff();

mixin _$LoginState {
  bool get isEmailValid;
  bool get isPasswordValid;
  bool get isSubmitting;
  bool get isSuccess;
  bool get isFailure;
  String get errorMessage;

  $LoginStateCopyWith<LoginState> get copyWith;
}

abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      bool isFailure,
      String errorMessage});
}

class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object isEmailValid = freezed,
    Object isPasswordValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object isFailure = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      isFailure: isFailure == freezed ? _value.isFailure : isFailure as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

abstract class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) then) =
      __$LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      bool isFailure,
      String errorMessage});
}

class __$LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(
      _LoginState _value, $Res Function(_LoginState) _then)
      : super(_value, (v) => _then(v as _LoginState));

  @override
  _LoginState get _value => super._value as _LoginState;

  @override
  $Res call({
    Object isEmailValid = freezed,
    Object isPasswordValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object isFailure = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_LoginState(
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      isFailure: isFailure == freezed ? _value.isFailure : isFailure as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

class _$_LoginState extends _LoginState {
  const _$_LoginState(
      {@required this.isEmailValid,
      @required this.isPasswordValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      this.errorMessage = ''})
      : assert(isEmailValid != null),
        assert(isPasswordValid != null),
        assert(isSubmitting != null),
        assert(isSuccess != null),
        assert(isFailure != null),
        assert(errorMessage != null),
        super._();

  @override
  final bool isEmailValid;
  @override
  final bool isPasswordValid;
  @override
  final bool isSubmitting;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;
  @JsonKey(defaultValue: '')
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'LoginState(isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginState &&
            (identical(other.isEmailValid, isEmailValid) ||
                const DeepCollectionEquality()
                    .equals(other.isEmailValid, isEmailValid)) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                const DeepCollectionEquality()
                    .equals(other.isPasswordValid, isPasswordValid)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.isFailure, isFailure) ||
                const DeepCollectionEquality()
                    .equals(other.isFailure, isFailure)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isEmailValid) ^
      const DeepCollectionEquality().hash(isPasswordValid) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(isFailure) ^
      const DeepCollectionEquality().hash(errorMessage);

  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  const _LoginState._() : super._();
  const factory _LoginState(
      {@required bool isEmailValid,
      @required bool isPasswordValid,
      @required bool isSubmitting,
      @required bool isSuccess,
      @required bool isFailure,
      String errorMessage}) = _$_LoginState;

  @override
  bool get isEmailValid;
  @override
  bool get isPasswordValid;
  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  String get errorMessage;
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith;
}
