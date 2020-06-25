// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'blog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Blog _$BlogFromJson(Map<String, dynamic> json) {
  return _Blog.fromJson(json);
}

class _$BlogTearOff {
  const _$BlogTearOff();

  _Blog call(List<Tag> tags, List<PostData> pages) {
    return _Blog(
      tags,
      pages,
    );
  }
}

// ignore: unused_element
const $Blog = _$BlogTearOff();

mixin _$Blog {
  List<Tag> get tags;
  List<PostData> get pages;

  Map<String, dynamic> toJson();
  $BlogCopyWith<Blog> get copyWith;
}

abstract class $BlogCopyWith<$Res> {
  factory $BlogCopyWith(Blog value, $Res Function(Blog) then) =
      _$BlogCopyWithImpl<$Res>;
  $Res call({List<Tag> tags, List<PostData> pages});
}

class _$BlogCopyWithImpl<$Res> implements $BlogCopyWith<$Res> {
  _$BlogCopyWithImpl(this._value, this._then);

  final Blog _value;
  // ignore: unused_field
  final $Res Function(Blog) _then;

  @override
  $Res call({
    Object tags = freezed,
    Object pages = freezed,
  }) {
    return _then(_value.copyWith(
      tags: tags == freezed ? _value.tags : tags as List<Tag>,
      pages: pages == freezed ? _value.pages : pages as List<PostData>,
    ));
  }
}

abstract class _$BlogCopyWith<$Res> implements $BlogCopyWith<$Res> {
  factory _$BlogCopyWith(_Blog value, $Res Function(_Blog) then) =
      __$BlogCopyWithImpl<$Res>;
  @override
  $Res call({List<Tag> tags, List<PostData> pages});
}

class __$BlogCopyWithImpl<$Res> extends _$BlogCopyWithImpl<$Res>
    implements _$BlogCopyWith<$Res> {
  __$BlogCopyWithImpl(_Blog _value, $Res Function(_Blog) _then)
      : super(_value, (v) => _then(v as _Blog));

  @override
  _Blog get _value => super._value as _Blog;

  @override
  $Res call({
    Object tags = freezed,
    Object pages = freezed,
  }) {
    return _then(_Blog(
      tags == freezed ? _value.tags : tags as List<Tag>,
      pages == freezed ? _value.pages : pages as List<PostData>,
    ));
  }
}

@JsonSerializable()
class _$_Blog implements _Blog {
  const _$_Blog(this.tags, this.pages)
      : assert(tags != null),
        assert(pages != null);

  factory _$_Blog.fromJson(Map<String, dynamic> json) =>
      _$_$_BlogFromJson(json);

  @override
  final List<Tag> tags;
  @override
  final List<PostData> pages;

  @override
  String toString() {
    return 'Blog(tags: $tags, pages: $pages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Blog &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.pages, pages) ||
                const DeepCollectionEquality().equals(other.pages, pages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(pages);

  @override
  _$BlogCopyWith<_Blog> get copyWith =>
      __$BlogCopyWithImpl<_Blog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BlogToJson(this);
  }
}

abstract class _Blog implements Blog {
  const factory _Blog(List<Tag> tags, List<PostData> pages) = _$_Blog;

  factory _Blog.fromJson(Map<String, dynamic> json) = _$_Blog.fromJson;

  @override
  List<Tag> get tags;
  @override
  List<PostData> get pages;
  @override
  _$BlogCopyWith<_Blog> get copyWith;
}
