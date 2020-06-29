// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PageEventTearOff {
  const _$PageEventTearOff();

  _Update update(PageState page) {
    return _Update(
      page,
    );
  }
}

// ignore: unused_element
const $PageEvent = _$PageEventTearOff();

mixin _$PageEvent {
  PageState get page;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result update(PageState page),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result update(PageState page),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result update(_Update value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result update(_Update value),
    @required Result orElse(),
  });

  $PageEventCopyWith<PageEvent> get copyWith;
}

abstract class $PageEventCopyWith<$Res> {
  factory $PageEventCopyWith(PageEvent value, $Res Function(PageEvent) then) =
      _$PageEventCopyWithImpl<$Res>;
  $Res call({PageState page});
}

class _$PageEventCopyWithImpl<$Res> implements $PageEventCopyWith<$Res> {
  _$PageEventCopyWithImpl(this._value, this._then);

  final PageEvent _value;
  // ignore: unused_field
  final $Res Function(PageEvent) _then;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed ? _value.page : page as PageState,
    ));
  }
}

abstract class _$UpdateCopyWith<$Res> implements $PageEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) then) =
      __$UpdateCopyWithImpl<$Res>;
  @override
  $Res call({PageState page});
}

class __$UpdateCopyWithImpl<$Res> extends _$PageEventCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(_Update _value, $Res Function(_Update) _then)
      : super(_value, (v) => _then(v as _Update));

  @override
  _Update get _value => super._value as _Update;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(_Update(
      page == freezed ? _value.page : page as PageState,
    ));
  }
}

class _$_Update implements _Update {
  const _$_Update(this.page) : assert(page != null);

  @override
  final PageState page;

  @override
  String toString() {
    return 'PageEvent.update(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Update &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(page);

  @override
  _$UpdateCopyWith<_Update> get copyWith =>
      __$UpdateCopyWithImpl<_Update>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result update(PageState page),
  }) {
    assert(update != null);
    return update(page);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result update(PageState page),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result update(_Update value),
  }) {
    assert(update != null);
    return update(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result update(_Update value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements PageEvent {
  const factory _Update(PageState page) = _$_Update;

  @override
  PageState get page;
  @override
  _$UpdateCopyWith<_Update> get copyWith;
}
