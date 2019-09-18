import 'package:fun_with_flutter/services/blog_service.dart';
import 'package:meta/meta.dart';
import 'package:fun_with_flutter/models/blog_model.dart';

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
      print(e);
      rethrow;
    }
  }
}
