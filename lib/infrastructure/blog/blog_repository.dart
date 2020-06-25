import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../domain/blog/blog.dart';
import 'blog_service.dart';

@immutable
class BlogRepository {
  const BlogRepository({@required BlogApi blogApi})
      : _blogApi = blogApi;

  final BlogApi _blogApi;

  Future<Blog> getBlogData() async {
    try {
      final data = await _blogApi.fetchData();
      final blog = Blog.fromJson(data);
      return blog;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
