import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fun_with_flutter/models/post_data.dart';
import 'package:fun_with_flutter/models/tag.dart';

part 'blog.freezed.dart';
part 'blog.g.dart';

@freezed
abstract class Blog with _$Blog{
  const factory Blog(List<Tag> tags, List<PostData> pages) = _Blog;

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
}