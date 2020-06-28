import 'package:dartz/dartz.dart';

import 'blog.dart';
import 'blog_failure.dart';

abstract class IBlogRepository {
  Future<Either<BlogFailure, Blog>> getBlogData();
}
