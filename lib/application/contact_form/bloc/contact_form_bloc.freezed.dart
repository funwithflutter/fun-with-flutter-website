// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'contact_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ContactFormEventTearOff {
  const _$ContactFormEventTearOff();

  _NameChanged nameChanged(String name) {
    return _NameChanged(
      name,
    );
  }

  _EmailChanged emailChanged(String email) {
    return _EmailChanged(
      email,
    );
  }

  _MessageChanged messageChanged(String message) {
    return _MessageChanged(
      message,
    );
  }

  _Submit submit() {
    return const _Submit();
  }
}

// ignore: unused_element
const $ContactFormEvent = _$ContactFormEventTearOff();

mixin _$ContactFormEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result emailChanged(String email),
    @required Result messageChanged(String message),
    @required Result submit(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result emailChanged(String email),
    Result messageChanged(String message),
    Result submit(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(_NameChanged value),
    @required Result emailChanged(_EmailChanged value),
    @required Result messageChanged(_MessageChanged value),
    @required Result submit(_Submit value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(_NameChanged value),
    Result emailChanged(_EmailChanged value),
    Result messageChanged(_MessageChanged value),
    Result submit(_Submit value),
    @required Result orElse(),
  });
}

abstract class $ContactFormEventCopyWith<$Res> {
  factory $ContactFormEventCopyWith(
          ContactFormEvent value, $Res Function(ContactFormEvent) then) =
      _$ContactFormEventCopyWithImpl<$Res>;
}

class _$ContactFormEventCopyWithImpl<$Res>
    implements $ContactFormEventCopyWith<$Res> {
  _$ContactFormEventCopyWithImpl(this._value, this._then);

  final ContactFormEvent _value;
  // ignore: unused_field
  final $Res Function(ContactFormEvent) _then;
}

abstract class _$NameChangedCopyWith<$Res> {
  factory _$NameChangedCopyWith(
          _NameChanged value, $Res Function(_NameChanged) then) =
      __$NameChangedCopyWithImpl<$Res>;
  $Res call({String name});
}

class __$NameChangedCopyWithImpl<$Res>
    extends _$ContactFormEventCopyWithImpl<$Res>
    implements _$NameChangedCopyWith<$Res> {
  __$NameChangedCopyWithImpl(
      _NameChanged _value, $Res Function(_NameChanged) _then)
      : super(_value, (v) => _then(v as _NameChanged));

  @override
  _NameChanged get _value => super._value as _NameChanged;

  @override
  $Res call({
    Object name = freezed,
  }) {
    return _then(_NameChanged(
      name == freezed ? _value.name : name as String,
    ));
  }
}

class _$_NameChanged implements _NameChanged {
  const _$_NameChanged(this.name) : assert(name != null);

  @override
  final String name;

  @override
  String toString() {
    return 'ContactFormEvent.nameChanged(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NameChanged &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @override
  _$NameChangedCopyWith<_NameChanged> get copyWith =>
      __$NameChangedCopyWithImpl<_NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result emailChanged(String email),
    @required Result messageChanged(String message),
    @required Result submit(),
  }) {
    assert(nameChanged != null);
    assert(emailChanged != null);
    assert(messageChanged != null);
    assert(submit != null);
    return nameChanged(name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result emailChanged(String email),
    Result messageChanged(String message),
    Result submit(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(_NameChanged value),
    @required Result emailChanged(_EmailChanged value),
    @required Result messageChanged(_MessageChanged value),
    @required Result submit(_Submit value),
  }) {
    assert(nameChanged != null);
    assert(emailChanged != null);
    assert(messageChanged != null);
    assert(submit != null);
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(_NameChanged value),
    Result emailChanged(_EmailChanged value),
    Result messageChanged(_MessageChanged value),
    Result submit(_Submit value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements ContactFormEvent {
  const factory _NameChanged(String name) = _$_NameChanged;

  String get name;
  _$NameChangedCopyWith<_NameChanged> get copyWith;
}

abstract class _$EmailChangedCopyWith<$Res> {
  factory _$EmailChangedCopyWith(
          _EmailChanged value, $Res Function(_EmailChanged) then) =
      __$EmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

class __$EmailChangedCopyWithImpl<$Res>
    extends _$ContactFormEventCopyWithImpl<$Res>
    implements _$EmailChangedCopyWith<$Res> {
  __$EmailChangedCopyWithImpl(
      _EmailChanged _value, $Res Function(_EmailChanged) _then)
      : super(_value, (v) => _then(v as _EmailChanged));

  @override
  _EmailChanged get _value => super._value as _EmailChanged;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(_EmailChanged(
      email == freezed ? _value.email : email as String,
    ));
  }
}

class _$_EmailChanged implements _EmailChanged {
  const _$_EmailChanged(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'ContactFormEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmailChanged &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  _$EmailChangedCopyWith<_EmailChanged> get copyWith =>
      __$EmailChangedCopyWithImpl<_EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result emailChanged(String email),
    @required Result messageChanged(String message),
    @required Result submit(),
  }) {
    assert(nameChanged != null);
    assert(emailChanged != null);
    assert(messageChanged != null);
    assert(submit != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result emailChanged(String email),
    Result messageChanged(String message),
    Result submit(),
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
    @required Result nameChanged(_NameChanged value),
    @required Result emailChanged(_EmailChanged value),
    @required Result messageChanged(_MessageChanged value),
    @required Result submit(_Submit value),
  }) {
    assert(nameChanged != null);
    assert(emailChanged != null);
    assert(messageChanged != null);
    assert(submit != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(_NameChanged value),
    Result emailChanged(_EmailChanged value),
    Result messageChanged(_MessageChanged value),
    Result submit(_Submit value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements ContactFormEvent {
  const factory _EmailChanged(String email) = _$_EmailChanged;

  String get email;
  _$EmailChangedCopyWith<_EmailChanged> get copyWith;
}

abstract class _$MessageChangedCopyWith<$Res> {
  factory _$MessageChangedCopyWith(
          _MessageChanged value, $Res Function(_MessageChanged) then) =
      __$MessageChangedCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$MessageChangedCopyWithImpl<$Res>
    extends _$ContactFormEventCopyWithImpl<$Res>
    implements _$MessageChangedCopyWith<$Res> {
  __$MessageChangedCopyWithImpl(
      _MessageChanged _value, $Res Function(_MessageChanged) _then)
      : super(_value, (v) => _then(v as _MessageChanged));

  @override
  _MessageChanged get _value => super._value as _MessageChanged;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_MessageChanged(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_MessageChanged implements _MessageChanged {
  const _$_MessageChanged(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'ContactFormEvent.messageChanged(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MessageChanged &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$MessageChangedCopyWith<_MessageChanged> get copyWith =>
      __$MessageChangedCopyWithImpl<_MessageChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result emailChanged(String email),
    @required Result messageChanged(String message),
    @required Result submit(),
  }) {
    assert(nameChanged != null);
    assert(emailChanged != null);
    assert(messageChanged != null);
    assert(submit != null);
    return messageChanged(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result emailChanged(String email),
    Result messageChanged(String message),
    Result submit(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (messageChanged != null) {
      return messageChanged(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(_NameChanged value),
    @required Result emailChanged(_EmailChanged value),
    @required Result messageChanged(_MessageChanged value),
    @required Result submit(_Submit value),
  }) {
    assert(nameChanged != null);
    assert(emailChanged != null);
    assert(messageChanged != null);
    assert(submit != null);
    return messageChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(_NameChanged value),
    Result emailChanged(_EmailChanged value),
    Result messageChanged(_MessageChanged value),
    Result submit(_Submit value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (messageChanged != null) {
      return messageChanged(this);
    }
    return orElse();
  }
}

abstract class _MessageChanged implements ContactFormEvent {
  const factory _MessageChanged(String message) = _$_MessageChanged;

  String get message;
  _$MessageChangedCopyWith<_MessageChanged> get copyWith;
}

abstract class _$SubmitCopyWith<$Res> {
  factory _$SubmitCopyWith(_Submit value, $Res Function(_Submit) then) =
      __$SubmitCopyWithImpl<$Res>;
}

class __$SubmitCopyWithImpl<$Res> extends _$ContactFormEventCopyWithImpl<$Res>
    implements _$SubmitCopyWith<$Res> {
  __$SubmitCopyWithImpl(_Submit _value, $Res Function(_Submit) _then)
      : super(_value, (v) => _then(v as _Submit));

  @override
  _Submit get _value => super._value as _Submit;
}

class _$_Submit implements _Submit {
  const _$_Submit();

  @override
  String toString() {
    return 'ContactFormEvent.submit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Submit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result emailChanged(String email),
    @required Result messageChanged(String message),
    @required Result submit(),
  }) {
    assert(nameChanged != null);
    assert(emailChanged != null);
    assert(messageChanged != null);
    assert(submit != null);
    return submit();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result emailChanged(String email),
    Result messageChanged(String message),
    Result submit(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (submit != null) {
      return submit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(_NameChanged value),
    @required Result emailChanged(_EmailChanged value),
    @required Result messageChanged(_MessageChanged value),
    @required Result submit(_Submit value),
  }) {
    assert(nameChanged != null);
    assert(emailChanged != null);
    assert(messageChanged != null);
    assert(submit != null);
    return submit(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(_NameChanged value),
    Result emailChanged(_EmailChanged value),
    Result messageChanged(_MessageChanged value),
    Result submit(_Submit value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements ContactFormEvent {
  const factory _Submit() = _$_Submit;
}

class _$ContactFormStateTearOff {
  const _$ContactFormStateTearOff();

  _ContactFormState call(
      {@required
          Name name,
      @required
          ReplyTo replyTo,
      @required
          Message message,
      @required
          bool showErrorMessages,
      @required
          bool isSubmitting,
      @required
          Option<Either<ContactFormFailure, Unit>>
              submitFailureOrSuccessOption}) {
    return _ContactFormState(
      name: name,
      replyTo: replyTo,
      message: message,
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      submitFailureOrSuccessOption: submitFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $ContactFormState = _$ContactFormStateTearOff();

mixin _$ContactFormState {
  Name get name;
  ReplyTo get replyTo;
  Message get message;
  bool get showErrorMessages;
  bool get isSubmitting;
  Option<Either<ContactFormFailure, Unit>> get submitFailureOrSuccessOption;

  $ContactFormStateCopyWith<ContactFormState> get copyWith;
}

abstract class $ContactFormStateCopyWith<$Res> {
  factory $ContactFormStateCopyWith(
          ContactFormState value, $Res Function(ContactFormState) then) =
      _$ContactFormStateCopyWithImpl<$Res>;
  $Res call(
      {Name name,
      ReplyTo replyTo,
      Message message,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ContactFormFailure, Unit>> submitFailureOrSuccessOption});
}

class _$ContactFormStateCopyWithImpl<$Res>
    implements $ContactFormStateCopyWith<$Res> {
  _$ContactFormStateCopyWithImpl(this._value, this._then);

  final ContactFormState _value;
  // ignore: unused_field
  final $Res Function(ContactFormState) _then;

  @override
  $Res call({
    Object name = freezed,
    Object replyTo = freezed,
    Object message = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object submitFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as Name,
      replyTo: replyTo == freezed ? _value.replyTo : replyTo as ReplyTo,
      message: message == freezed ? _value.message : message as Message,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      submitFailureOrSuccessOption: submitFailureOrSuccessOption == freezed
          ? _value.submitFailureOrSuccessOption
          : submitFailureOrSuccessOption
              as Option<Either<ContactFormFailure, Unit>>,
    ));
  }
}

abstract class _$ContactFormStateCopyWith<$Res>
    implements $ContactFormStateCopyWith<$Res> {
  factory _$ContactFormStateCopyWith(
          _ContactFormState value, $Res Function(_ContactFormState) then) =
      __$ContactFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Name name,
      ReplyTo replyTo,
      Message message,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ContactFormFailure, Unit>> submitFailureOrSuccessOption});
}

class __$ContactFormStateCopyWithImpl<$Res>
    extends _$ContactFormStateCopyWithImpl<$Res>
    implements _$ContactFormStateCopyWith<$Res> {
  __$ContactFormStateCopyWithImpl(
      _ContactFormState _value, $Res Function(_ContactFormState) _then)
      : super(_value, (v) => _then(v as _ContactFormState));

  @override
  _ContactFormState get _value => super._value as _ContactFormState;

  @override
  $Res call({
    Object name = freezed,
    Object replyTo = freezed,
    Object message = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object submitFailureOrSuccessOption = freezed,
  }) {
    return _then(_ContactFormState(
      name: name == freezed ? _value.name : name as Name,
      replyTo: replyTo == freezed ? _value.replyTo : replyTo as ReplyTo,
      message: message == freezed ? _value.message : message as Message,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      submitFailureOrSuccessOption: submitFailureOrSuccessOption == freezed
          ? _value.submitFailureOrSuccessOption
          : submitFailureOrSuccessOption
              as Option<Either<ContactFormFailure, Unit>>,
    ));
  }
}

class _$_ContactFormState implements _ContactFormState {
  const _$_ContactFormState(
      {@required this.name,
      @required this.replyTo,
      @required this.message,
      @required this.showErrorMessages,
      @required this.isSubmitting,
      @required this.submitFailureOrSuccessOption})
      : assert(name != null),
        assert(replyTo != null),
        assert(message != null),
        assert(showErrorMessages != null),
        assert(isSubmitting != null),
        assert(submitFailureOrSuccessOption != null);

  @override
  final Name name;
  @override
  final ReplyTo replyTo;
  @override
  final Message message;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ContactFormFailure, Unit>> submitFailureOrSuccessOption;

  @override
  String toString() {
    return 'ContactFormState(name: $name, replyTo: $replyTo, message: $message, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, submitFailureOrSuccessOption: $submitFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContactFormState &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.replyTo, replyTo) ||
                const DeepCollectionEquality()
                    .equals(other.replyTo, replyTo)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.submitFailureOrSuccessOption,
                    submitFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.submitFailureOrSuccessOption,
                    submitFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(replyTo) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(submitFailureOrSuccessOption);

  @override
  _$ContactFormStateCopyWith<_ContactFormState> get copyWith =>
      __$ContactFormStateCopyWithImpl<_ContactFormState>(this, _$identity);
}

abstract class _ContactFormState implements ContactFormState {
  const factory _ContactFormState(
      {@required
          Name name,
      @required
          ReplyTo replyTo,
      @required
          Message message,
      @required
          bool showErrorMessages,
      @required
          bool isSubmitting,
      @required
          Option<Either<ContactFormFailure, Unit>>
              submitFailureOrSuccessOption}) = _$_ContactFormState;

  @override
  Name get name;
  @override
  ReplyTo get replyTo;
  @override
  Message get message;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ContactFormFailure, Unit>> get submitFailureOrSuccessOption;
  @override
  _$ContactFormStateCopyWith<_ContactFormState> get copyWith;
}
