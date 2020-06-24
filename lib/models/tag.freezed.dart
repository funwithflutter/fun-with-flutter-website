// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Tag _$TagFromJson(Map<String, dynamic> json) {
  return _Tag.fromJson(json);
}

class _$TagTearOff {
  const _$TagTearOff();

  _Tag call(String name, List<PostData> pages) {
    return _Tag(
      name,
      pages,
    );
  }
}

// ignore: unused_element
const $Tag = _$TagTearOff();

mixin _$Tag {
  String get name;
  List<PostData> get pages;

  Map<String, dynamic> toJson();
  $TagCopyWith<Tag> get copyWith;
}

abstract class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) then) =
      _$TagCopyWithImpl<$Res>;
  $Res call({String name, List<PostData> pages});
}

class _$TagCopyWithImpl<$Res> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._value, this._then);

  final Tag _value;
  // ignore: unused_field
  final $Res Function(Tag) _then;

  @override
  $Res call({
    Object name = freezed,
    Object pages = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      pages: pages == freezed ? _value.pages : pages as List<PostData>,
    ));
  }
}

abstract class _$TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$TagCopyWith(_Tag value, $Res Function(_Tag) then) =
      __$TagCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<PostData> pages});
}

class __$TagCopyWithImpl<$Res> extends _$TagCopyWithImpl<$Res>
    implements _$TagCopyWith<$Res> {
  __$TagCopyWithImpl(_Tag _value, $Res Function(_Tag) _then)
      : super(_value, (v) => _then(v as _Tag));

  @override
  _Tag get _value => super._value as _Tag;

  @override
  $Res call({
    Object name = freezed,
    Object pages = freezed,
  }) {
    return _then(_Tag(
      name == freezed ? _value.name : name as String,
      pages == freezed ? _value.pages : pages as List<PostData>,
    ));
  }
}

@JsonSerializable()
class _$_Tag implements _Tag {
  const _$_Tag(this.name, this.pages)
      : assert(name != null),
        assert(pages != null);

  factory _$_Tag.fromJson(Map<String, dynamic> json) => _$_$_TagFromJson(json);

  @override
  final String name;
  @override
  final List<PostData> pages;

  @override
  String toString() {
    return 'Tag(name: $name, pages: $pages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Tag &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.pages, pages) ||
                const DeepCollectionEquality().equals(other.pages, pages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(pages);

  @override
  _$TagCopyWith<_Tag> get copyWith =>
      __$TagCopyWithImpl<_Tag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TagToJson(this);
  }
}

abstract class _Tag implements Tag {
  const factory _Tag(String name, List<PostData> pages) = _$_Tag;

  factory _Tag.fromJson(Map<String, dynamic> json) = _$_Tag.fromJson;

  @override
  String get name;
  @override
  List<PostData> get pages;
  @override
  _$TagCopyWith<_Tag> get copyWith;
}
