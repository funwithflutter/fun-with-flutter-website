import 'package:freezed_annotation/freezed_annotation.dart';

import 'post_data.dart';
import 'tag.dart';

part 'blog.freezed.dart';
part 'blog.g.dart';

@freezed
abstract class Blog with _$Blog{
  const factory Blog(List<Tag> tags, List<PostData> pages) = _Blog;

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
}