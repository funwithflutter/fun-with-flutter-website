import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_data.freezed.dart';
part 'post_data.g.dart';

@freezed
abstract class PostData with _$PostData {
  const factory PostData(
      String description, String title, String uri, String thumbnail,
      [@Default(['']) List<String> tags]) = _PostData;

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
}
