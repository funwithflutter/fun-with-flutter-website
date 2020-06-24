// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tag _$_$_TagFromJson(Map<String, dynamic> json) {
  return _$_Tag(
    json['name'] as String,
    (json['pages'] as List)
        ?.map((e) =>
            e == null ? null : PostData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_TagToJson(_$_Tag instance) => <String, dynamic>{
      'name': instance.name,
      'pages': instance.pages,
    };
