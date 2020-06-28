import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/blog/blog.dart';
import '../../domain/blog/blog_failure.dart';
import '../../domain/blog/i_blog_repository.dart';
import '../core/urls.dart';
import 'blog_api.dart';

@dev
@Injectable(as: IBlogRepository)
class DevBlogRepository implements IBlogRepository {
  final BlogApi _blogApi = BlogApi('$blogTestingUrl/index.json');

  @override
  Future<Either<BlogFailure, Blog>> getBlogData() async {
    try {
      final data = await _blogApi.fetchData();
      final blog = Blog.fromJson(data);
      return right(blog);
    } on Exception catch (e) {
      debugPrint(e.toString());
      return left(const BlogFailure.serverError());
    }
  }
}
