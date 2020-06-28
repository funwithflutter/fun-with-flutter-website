import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/blog/blog.dart';
import '../../domain/blog/i_blog_repository.dart';
import '../core/urls.dart';
import 'blog_api.dart';

@dev
@Injectable(as: IBlogRepository)
class DevBlogRepository implements IBlogRepository {
  final BlogApi _blogApi = BlogApi('$blogTestingUrl/index.json');

  @override
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
