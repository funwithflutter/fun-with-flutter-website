// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'post_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PostData _$PostDataFromJson(Map<String, dynamic> json) {
  return _PostData.fromJson(json);
}

class _$PostDataTearOff {
  const _$PostDataTearOff();

  _PostData call(String description, String title, String uri, String thumbnail,
      [List<String> tags = const ['']]) {
    return _PostData(
      description,
      title,
      uri,
      thumbnail,
      tags,
    );
  }
}

// ignore: unused_element
const $PostData = _$PostDataTearOff();

mixin _$PostData {
  String get description;
  String get title;
  String get uri;
  String get thumbnail;
  List<String> get tags;

  Map<String, dynamic> toJson();
  $PostDataCopyWith<PostData> get copyWith;
}

abstract class $PostDataCopyWith<$Res> {
  factory $PostDataCopyWith(PostData value, $Res Function(PostData) then) =
      _$PostDataCopyWithImpl<$Res>;
  $Res call(
      {String description,
      String title,
      String uri,
      String thumbnail,
      List<String> tags});
}

class _$PostDataCopyWithImpl<$Res> implements $PostDataCopyWith<$Res> {
  _$PostDataCopyWithImpl(this._value, this._then);

  final PostData _value;
  // ignore: unused_field
  final $Res Function(PostData) _then;

  @override
  $Res call({
    Object description = freezed,
    Object title = freezed,
    Object uri = freezed,
    Object thumbnail = freezed,
    Object tags = freezed,
  }) {
    return _then(_value.copyWith(
      description:
          description == freezed ? _value.description : description as String,
      title: title == freezed ? _value.title : title as String,
      uri: uri == freezed ? _value.uri : uri as String,
      thumbnail: thumbnail == freezed ? _value.thumbnail : thumbnail as String,
      tags: tags == freezed ? _value.tags : tags as List<String>,
    ));
  }
}

abstract class _$PostDataCopyWith<$Res> implements $PostDataCopyWith<$Res> {
  factory _$PostDataCopyWith(_PostData value, $Res Function(_PostData) then) =
      __$PostDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String description,
      String title,
      String uri,
      String thumbnail,
      List<String> tags});
}

class __$PostDataCopyWithImpl<$Res> extends _$PostDataCopyWithImpl<$Res>
    implements _$PostDataCopyWith<$Res> {
  __$PostDataCopyWithImpl(_PostData _value, $Res Function(_PostData) _then)
      : super(_value, (v) => _then(v as _PostData));

  @override
  _PostData get _value => super._value as _PostData;

  @override
  $Res call({
    Object description = freezed,
    Object title = freezed,
    Object uri = freezed,
    Object thumbnail = freezed,
    Object tags = freezed,
  }) {
    return _then(_PostData(
      description == freezed ? _value.description : description as String,
      title == freezed ? _value.title : title as String,
      uri == freezed ? _value.uri : uri as String,
      thumbnail == freezed ? _value.thumbnail : thumbnail as String,
      tags == freezed ? _value.tags : tags as List<String>,
    ));
  }
}

@JsonSerializable()
class _$_PostData implements _PostData {
  const _$_PostData(this.description, this.title, this.uri, this.thumbnail,
      [this.tags = const ['']])
      : assert(description != null),
        assert(title != null),
        assert(uri != null),
        assert(thumbnail != null),
        assert(tags != null);

  factory _$_PostData.fromJson(Map<String, dynamic> json) =>
      _$_$_PostDataFromJson(json);

  @override
  final String description;
  @override
  final String title;
  @override
  final String uri;
  @override
  final String thumbnail;
  @JsonKey(defaultValue: const [''])
  @override
  final List<String> tags;

  @override
  String toString() {
    return 'PostData(description: $description, title: $title, uri: $uri, thumbnail: $thumbnail, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostData &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.uri, uri) ||
                const DeepCollectionEquality().equals(other.uri, uri)) &&
            (identical(other.thumbnail, thumbnail) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnail, thumbnail)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(uri) ^
      const DeepCollectionEquality().hash(thumbnail) ^
      const DeepCollectionEquality().hash(tags);

  @override
  _$PostDataCopyWith<_PostData> get copyWith =>
      __$PostDataCopyWithImpl<_PostData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostDataToJson(this);
  }
}

abstract class _PostData implements PostData {
  const factory _PostData(
      String description, String title, String uri, String thumbnail,
      [List<String> tags]) = _$_PostData;

  factory _PostData.fromJson(Map<String, dynamic> json) = _$_PostData.fromJson;

  @override
  String get description;
  @override
  String get title;
  @override
  String get uri;
  @override
  String get thumbnail;
  @override
  List<String> get tags;
  @override
  _$PostDataCopyWith<_PostData> get copyWith;
}
