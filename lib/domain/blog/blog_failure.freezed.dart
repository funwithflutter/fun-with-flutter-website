// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'blog_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BlogFailureTearOff {
  const _$BlogFailureTearOff();

  ServerError serverError() {
    return const ServerError();
  }
}

// ignore: unused_element
const $BlogFailure = _$BlogFailureTearOff();

mixin _$BlogFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    @required Result orElse(),
  });
}

abstract class $BlogFailureCopyWith<$Res> {
  factory $BlogFailureCopyWith(
          BlogFailure value, $Res Function(BlogFailure) then) =
      _$BlogFailureCopyWithImpl<$Res>;
}

class _$BlogFailureCopyWithImpl<$Res> implements $BlogFailureCopyWith<$Res> {
  _$BlogFailureCopyWithImpl(this._value, this._then);

  final BlogFailure _value;
  // ignore: unused_field
  final $Res Function(BlogFailure) _then;
}

abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

class _$ServerErrorCopyWithImpl<$Res> extends _$BlogFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'BlogFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
  }) {
    assert(serverError != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
  }) {
    assert(serverError != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements BlogFailure {
  const factory ServerError() = _$ServerError;
}
