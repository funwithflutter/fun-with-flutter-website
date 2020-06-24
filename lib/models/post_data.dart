

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_data.freezed.dart';
part 'post_data.g.dart';

@freezed
abstract class PostData with _$PostData{
  const factory PostData(String description, String title, String uri, String thumbnail) = _PostData;

  factory PostData.fromJson(Map<String, dynamic> json) => _$PostDataFromJson(json);
}

// class PostData {
//   PostData(this.description, this.title, this.uri, this.thumbnail);

//   PostData.fromJson(Map<String, dynamic> json)
//       : description = json['description'],
//         title = json['title'],
//         uri = json['uri'],
//         thumbnail = json['thumbnail'];

//   final String description;
//   final String title;
//   final String uri;
//   final String thumbnail;
// }