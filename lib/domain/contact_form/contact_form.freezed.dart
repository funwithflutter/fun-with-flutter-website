// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'contact_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ContactFormTearOff {
  const _$ContactFormTearOff();

  _ContactForm call(Name name, ReplyTo replyTo, Message message) {
    return _ContactForm(
      name,
      replyTo,
      message,
    );
  }
}

// ignore: unused_element
const $ContactForm = _$ContactFormTearOff();

mixin _$ContactForm {
  Name get name;
  ReplyTo get replyTo;
  Message get message;

  $ContactFormCopyWith<ContactForm> get copyWith;
}

abstract class $ContactFormCopyWith<$Res> {
  factory $ContactFormCopyWith(
          ContactForm value, $Res Function(ContactForm) then) =
      _$ContactFormCopyWithImpl<$Res>;
  $Res call({Name name, ReplyTo replyTo, Message message});
}

class _$ContactFormCopyWithImpl<$Res> implements $ContactFormCopyWith<$Res> {
  _$ContactFormCopyWithImpl(this._value, this._then);

  final ContactForm _value;
  // ignore: unused_field
  final $Res Function(ContactForm) _then;

  @override
  $Res call({
    Object name = freezed,
    Object replyTo = freezed,
    Object message = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as Name,
      replyTo: replyTo == freezed ? _value.replyTo : replyTo as ReplyTo,
      message: message == freezed ? _value.message : message as Message,
    ));
  }
}

abstract class _$ContactFormCopyWith<$Res>
    implements $ContactFormCopyWith<$Res> {
  factory _$ContactFormCopyWith(
          _ContactForm value, $Res Function(_ContactForm) then) =
      __$ContactFormCopyWithImpl<$Res>;
  @override
  $Res call({Name name, ReplyTo replyTo, Message message});
}

class __$ContactFormCopyWithImpl<$Res> extends _$ContactFormCopyWithImpl<$Res>
    implements _$ContactFormCopyWith<$Res> {
  __$ContactFormCopyWithImpl(
      _ContactForm _value, $Res Function(_ContactForm) _then)
      : super(_value, (v) => _then(v as _ContactForm));

  @override
  _ContactForm get _value => super._value as _ContactForm;

  @override
  $Res call({
    Object name = freezed,
    Object replyTo = freezed,
    Object message = freezed,
  }) {
    return _then(_ContactForm(
      name == freezed ? _value.name : name as Name,
      replyTo == freezed ? _value.replyTo : replyTo as ReplyTo,
      message == freezed ? _value.message : message as Message,
    ));
  }
}

class _$_ContactForm implements _ContactForm {
  const _$_ContactForm(this.name, this.replyTo, this.message)
      : assert(name != null),
        assert(replyTo != null),
        assert(message != null);

  @override
  final Name name;
  @override
  final ReplyTo replyTo;
  @override
  final Message message;

  @override
  String toString() {
    return 'ContactForm(name: $name, replyTo: $replyTo, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContactForm &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.replyTo, replyTo) ||
                const DeepCollectionEquality()
                    .equals(other.replyTo, replyTo)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(replyTo) ^
      const DeepCollectionEquality().hash(message);

  @override
  _$ContactFormCopyWith<_ContactForm> get copyWith =>
      __$ContactFormCopyWithImpl<_ContactForm>(this, _$identity);
}

abstract class _ContactForm implements ContactForm {
  const factory _ContactForm(Name name, ReplyTo replyTo, Message message) =
      _$_ContactForm;

  @override
  Name get name;
  @override
  ReplyTo get replyTo;
  @override
  Message get message;
  @override
  _$ContactFormCopyWith<_ContactForm> get copyWith;
}
