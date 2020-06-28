import 'blog.dart';

abstract class IBlogRepository {
  Future<Blog> getBlogData();
}
