// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostData _$_$_PostDataFromJson(Map<String, dynamic> json) {
  return _$_PostData(
    json['description'] as String,
    json['title'] as String,
    json['uri'] as String,
    json['thumbnail'] as String,
  );
}

Map<String, dynamic> _$_$_PostDataToJson(_$_PostData instance) =>
    <String, dynamic>{
      'description': instance.description,
      'title': instance.title,
      'uri': instance.uri,
      'thumbnail': instance.thumbnail,
    };
