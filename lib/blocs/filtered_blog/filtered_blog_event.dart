import 'package:equatable/equatable.dart';
import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FilteredBlogEvent extends Equatable {
  FilteredBlogEvent([List props = const []]) : super(props);
}

class UpdateFilteredBlog extends FilteredBlogEvent {
  final Blog blog;

  UpdateFilteredBlog(this.blog) : super([blog]);

  @override
  String toString() => 'UpdateFilteredBlog';
}

class FilterByTag extends FilteredBlogEvent {
  final String tagFilter;

  FilterByTag(this.tagFilter): super([tagFilter]);

  @override
  String toString() => 'FilterByTag';
}

class ClearFilters extends FilteredBlogEvent {
  @override
  String toString() => 'ClearFilters';
}
