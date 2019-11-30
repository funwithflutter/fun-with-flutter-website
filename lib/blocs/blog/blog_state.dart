import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlogState {
  BlogState();
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
  BlogLoaded(this.blog, this.tags) : super();

  final Blog blog;
  final List<String> tags;

  @override
  String toString() => 'BlogLoaded';
}
