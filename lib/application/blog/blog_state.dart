import 'package:meta/meta.dart';

import '../../domain/blog/blog.dart';

@immutable
abstract class BlogState {
  const BlogState();
}

/// This is the default state
class BlogLoading extends BlogState {
  @override
  String toString() => 'BlogLoading';
}

class BlogError extends BlogState {
  @override
  String toString() => 'BlogError';
}

class BlogLoaded extends BlogState {
  const BlogLoaded(this.blog, this.tags) : super();

  final Blog blog;
  final List<String> tags;

  @override
  String toString() => 'BlogLoaded';
}
