import 'package:fun_with_flutter/dataprovider/blog_data_provider.dart';
import 'package:fun_with_flutter/models/blog_model.dart';

class BlogRepository {
  BlogRepository({BlogDataProvider blogDataProvider})
      : _blogDataProvider = blogDataProvider ?? BlogDataProvider();

  final BlogDataProvider _blogDataProvider;

  Future<Blog> getBlogData() async {
    final data = await _blogDataProvider.fetchData();
    final blog = Blog.fromJson(data);
    return blog;
  }
}
