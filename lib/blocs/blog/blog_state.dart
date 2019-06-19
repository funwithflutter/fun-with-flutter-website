import 'package:equatable/equatable.dart';
import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlogState extends Equatable {
  BlogState([List props = const []]) : super(props);
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
  final Blog blog;
  final List<String> tags;

  BlogLoaded(this.blog, this.tags): super([blog, tags]);

  @override
  String toString() => 'BlogLoaded';
}
