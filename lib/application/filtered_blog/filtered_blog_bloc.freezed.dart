// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'filtered_blog_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FilterBlogEventTearOff {
  const _$FilterBlogEventTearOff();

  _Update update(Blog blog) {
    return _Update(
      blog,
    );
  }

  _FilterByTag filterByTag(String tag) {
    return _FilterByTag(
      tag,
    );
  }

  _ClearFilters clearFilters() {
    return const _ClearFilters();
  }
}

// ignore: unused_element
const $FilterBlogEvent = _$FilterBlogEventTearOff();

mixin _$FilterBlogEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result update(Blog blog),
    @required Result filterByTag(String tag),
    @required Result clearFilters(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result update(Blog blog),
    Result filterByTag(String tag),
    Result clearFilters(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result update(_Update value),
    @required Result filterByTag(_FilterByTag value),
    @required Result clearFilters(_ClearFilters value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result update(_Update value),
    Result filterByTag(_FilterByTag value),
    Result clearFilters(_ClearFilters value),
    @required Result orElse(),
  });
}

abstract class $FilterBlogEventCopyWith<$Res> {
  factory $FilterBlogEventCopyWith(
          FilterBlogEvent value, $Res Function(FilterBlogEvent) then) =
      _$FilterBlogEventCopyWithImpl<$Res>;
}

class _$FilterBlogEventCopyWithImpl<$Res>
    implements $FilterBlogEventCopyWith<$Res> {
  _$FilterBlogEventCopyWithImpl(this._value, this._then);

  final FilterBlogEvent _value;
  // ignore: unused_field
  final $Res Function(FilterBlogEvent) _then;
}

abstract class _$UpdateCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) then) =
      __$UpdateCopyWithImpl<$Res>;
  $Res call({Blog blog});

  $BlogCopyWith<$Res> get blog;
}

class __$UpdateCopyWithImpl<$Res> extends _$FilterBlogEventCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(_Update _value, $Res Function(_Update) _then)
      : super(_value, (v) => _then(v as _Update));

  @override
  _Update get _value => super._value as _Update;

  @override
  $Res call({
    Object blog = freezed,
  }) {
    return _then(_Update(
      blog == freezed ? _value.blog : blog as Blog,
    ));
  }

  @override
  $BlogCopyWith<$Res> get blog {
    if (_value.blog == null) {
      return null;
    }
    return $BlogCopyWith<$Res>(_value.blog, (value) {
      return _then(_value.copyWith(blog: value));
    });
  }
}

class _$_Update with DiagnosticableTreeMixin implements _Update {
  const _$_Update(this.blog) : assert(blog != null);

  @override
  final Blog blog;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilterBlogEvent.update(blog: $blog)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FilterBlogEvent.update'))
      ..add(DiagnosticsProperty('blog', blog));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Update &&
            (identical(other.blog, blog) ||
                const DeepCollectionEquality().equals(other.blog, blog)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(blog);

  @override
  _$UpdateCopyWith<_Update> get copyWith =>
      __$UpdateCopyWithImpl<_Update>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result update(Blog blog),
    @required Result filterByTag(String tag),
    @required Result clearFilters(),
  }) {
    assert(update != null);
    assert(filterByTag != null);
    assert(clearFilters != null);
    return update(blog);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result update(Blog blog),
    Result filterByTag(String tag),
    Result clearFilters(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(blog);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result update(_Update value),
    @required Result filterByTag(_FilterByTag value),
    @required Result clearFilters(_ClearFilters value),
  }) {
    assert(update != null);
    assert(filterByTag != null);
    assert(clearFilters != null);
    return update(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result update(_Update value),
    Result filterByTag(_FilterByTag value),
    Result clearFilters(_ClearFilters value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements FilterBlogEvent {
  const factory _Update(Blog blog) = _$_Update;

  Blog get blog;
  _$UpdateCopyWith<_Update> get copyWith;
}

abstract class _$FilterByTagCopyWith<$Res> {
  factory _$FilterByTagCopyWith(
          _FilterByTag value, $Res Function(_FilterByTag) then) =
      __$FilterByTagCopyWithImpl<$Res>;
  $Res call({String tag});
}

class __$FilterByTagCopyWithImpl<$Res>
    extends _$FilterBlogEventCopyWithImpl<$Res>
    implements _$FilterByTagCopyWith<$Res> {
  __$FilterByTagCopyWithImpl(
      _FilterByTag _value, $Res Function(_FilterByTag) _then)
      : super(_value, (v) => _then(v as _FilterByTag));

  @override
  _FilterByTag get _value => super._value as _FilterByTag;

  @override
  $Res call({
    Object tag = freezed,
  }) {
    return _then(_FilterByTag(
      tag == freezed ? _value.tag : tag as String,
    ));
  }
}

class _$_FilterByTag with DiagnosticableTreeMixin implements _FilterByTag {
  const _$_FilterByTag(this.tag) : assert(tag != null);

  @override
  final String tag;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilterBlogEvent.filterByTag(tag: $tag)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FilterBlogEvent.filterByTag'))
      ..add(DiagnosticsProperty('tag', tag));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FilterByTag &&
            (identical(other.tag, tag) ||
                const DeepCollectionEquality().equals(other.tag, tag)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tag);

  @override
  _$FilterByTagCopyWith<_FilterByTag> get copyWith =>
      __$FilterByTagCopyWithImpl<_FilterByTag>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result update(Blog blog),
    @required Result filterByTag(String tag),
    @required Result clearFilters(),
  }) {
    assert(update != null);
    assert(filterByTag != null);
    assert(clearFilters != null);
    return filterByTag(tag);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result update(Blog blog),
    Result filterByTag(String tag),
    Result clearFilters(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (filterByTag != null) {
      return filterByTag(tag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result update(_Update value),
    @required Result filterByTag(_FilterByTag value),
    @required Result clearFilters(_ClearFilters value),
  }) {
    assert(update != null);
    assert(filterByTag != null);
    assert(clearFilters != null);
    return filterByTag(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result update(_Update value),
    Result filterByTag(_FilterByTag value),
    Result clearFilters(_ClearFilters value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (filterByTag != null) {
      return filterByTag(this);
    }
    return orElse();
  }
}

abstract class _FilterByTag implements FilterBlogEvent {
  const factory _FilterByTag(String tag) = _$_FilterByTag;

  String get tag;
  _$FilterByTagCopyWith<_FilterByTag> get copyWith;
}

abstract class _$ClearFiltersCopyWith<$Res> {
  factory _$ClearFiltersCopyWith(
          _ClearFilters value, $Res Function(_ClearFilters) then) =
      __$ClearFiltersCopyWithImpl<$Res>;
}

class __$ClearFiltersCopyWithImpl<$Res>
    extends _$FilterBlogEventCopyWithImpl<$Res>
    implements _$ClearFiltersCopyWith<$Res> {
  __$ClearFiltersCopyWithImpl(
      _ClearFilters _value, $Res Function(_ClearFilters) _then)
      : super(_value, (v) => _then(v as _ClearFilters));

  @override
  _ClearFilters get _value => super._value as _ClearFilters;
}

class _$_ClearFilters with DiagnosticableTreeMixin implements _ClearFilters {
  const _$_ClearFilters();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilterBlogEvent.clearFilters()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FilterBlogEvent.clearFilters'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ClearFilters);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result update(Blog blog),
    @required Result filterByTag(String tag),
    @required Result clearFilters(),
  }) {
    assert(update != null);
    assert(filterByTag != null);
    assert(clearFilters != null);
    return clearFilters();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result update(Blog blog),
    Result filterByTag(String tag),
    Result clearFilters(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (clearFilters != null) {
      return clearFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result update(_Update value),
    @required Result filterByTag(_FilterByTag value),
    @required Result clearFilters(_ClearFilters value),
  }) {
    assert(update != null);
    assert(filterByTag != null);
    assert(clearFilters != null);
    return clearFilters(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result update(_Update value),
    Result filterByTag(_FilterByTag value),
    Result clearFilters(_ClearFilters value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (clearFilters != null) {
      return clearFilters(this);
    }
    return orElse();
  }
}

abstract class _ClearFilters implements FilterBlogEvent {
  const factory _ClearFilters() = _$_ClearFilters;
}

class _$FilterBlogStateTearOff {
  const _$FilterBlogStateTearOff();

  _Error error() {
    return const _Error();
  }

  _Loading loading() {
    return const _Loading();
  }

  _Loaded loaded(Blog filteredBlog, String tagFilter) {
    return _Loaded(
      filteredBlog,
      tagFilter,
    );
  }
}

// ignore: unused_element
const $FilterBlogState = _$FilterBlogStateTearOff();

mixin _$FilterBlogState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(),
    @required Result loading(),
    @required Result loaded(Blog filteredBlog, String tagFilter),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(),
    Result loading(),
    Result loaded(Blog filteredBlog, String tagFilter),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result error(_Error value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result error(_Error value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    @required Result orElse(),
  });
}

abstract class $FilterBlogStateCopyWith<$Res> {
  factory $FilterBlogStateCopyWith(
          FilterBlogState value, $Res Function(FilterBlogState) then) =
      _$FilterBlogStateCopyWithImpl<$Res>;
}

class _$FilterBlogStateCopyWithImpl<$Res>
    implements $FilterBlogStateCopyWith<$Res> {
  _$FilterBlogStateCopyWithImpl(this._value, this._then);

  final FilterBlogState _value;
  // ignore: unused_field
  final $Res Function(FilterBlogState) _then;
}

abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

class __$ErrorCopyWithImpl<$Res> extends _$FilterBlogStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;
}

class _$_Error with DiagnosticableTreeMixin implements _Error {
  const _$_Error();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilterBlogState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'FilterBlogState.error'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(),
    @required Result loading(),
    @required Result loaded(Blog filteredBlog, String tagFilter),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return error();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(),
    Result loading(),
    Result loaded(Blog filteredBlog, String tagFilter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result error(_Error value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result error(_Error value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements FilterBlogState {
  const factory _Error() = _$_Error;
}

abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

class __$LoadingCopyWithImpl<$Res> extends _$FilterBlogStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

class _$_Loading with DiagnosticableTreeMixin implements _Loading {
  const _$_Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilterBlogState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'FilterBlogState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(),
    @required Result loading(),
    @required Result loaded(Blog filteredBlog, String tagFilter),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(),
    Result loading(),
    Result loaded(Blog filteredBlog, String tagFilter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result error(_Error value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result error(_Error value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements FilterBlogState {
  const factory _Loading() = _$_Loading;
}

abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call({Blog filteredBlog, String tagFilter});

  $BlogCopyWith<$Res> get filteredBlog;
}

class __$LoadedCopyWithImpl<$Res> extends _$FilterBlogStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object filteredBlog = freezed,
    Object tagFilter = freezed,
  }) {
    return _then(_Loaded(
      filteredBlog == freezed ? _value.filteredBlog : filteredBlog as Blog,
      tagFilter == freezed ? _value.tagFilter : tagFilter as String,
    ));
  }

  @override
  $BlogCopyWith<$Res> get filteredBlog {
    if (_value.filteredBlog == null) {
      return null;
    }
    return $BlogCopyWith<$Res>(_value.filteredBlog, (value) {
      return _then(_value.copyWith(filteredBlog: value));
    });
  }
}

class _$_Loaded with DiagnosticableTreeMixin implements _Loaded {
  const _$_Loaded(this.filteredBlog, this.tagFilter)
      : assert(filteredBlog != null),
        assert(tagFilter != null);

  @override
  final Blog filteredBlog;
  @override
  final String tagFilter;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilterBlogState.loaded(filteredBlog: $filteredBlog, tagFilter: $tagFilter)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FilterBlogState.loaded'))
      ..add(DiagnosticsProperty('filteredBlog', filteredBlog))
      ..add(DiagnosticsProperty('tagFilter', tagFilter));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.filteredBlog, filteredBlog) ||
                const DeepCollectionEquality()
                    .equals(other.filteredBlog, filteredBlog)) &&
            (identical(other.tagFilter, tagFilter) ||
                const DeepCollectionEquality()
                    .equals(other.tagFilter, tagFilter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(filteredBlog) ^
      const DeepCollectionEquality().hash(tagFilter);

  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result error(),
    @required Result loading(),
    @required Result loaded(Blog filteredBlog, String tagFilter),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return loaded(filteredBlog, tagFilter);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result error(),
    Result loading(),
    Result loaded(Blog filteredBlog, String tagFilter),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(filteredBlog, tagFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result error(_Error value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
  }) {
    assert(error != null);
    assert(loading != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result error(_Error value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements FilterBlogState {
  const factory _Loaded(Blog filteredBlog, String tagFilter) = _$_Loaded;

  Blog get filteredBlog;
  String get tagFilter;
  _$LoadedCopyWith<_Loaded> get copyWith;
}
