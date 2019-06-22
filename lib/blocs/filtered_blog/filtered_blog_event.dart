import 'package:equatable/equatable.dart';
import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FilteredBlogEvent extends Equatable {
  FilteredBlogEvent([List props = const []]) : super(props);
}

class UpdateFilteredBlog extends FilteredBlogEvent {
  UpdateFilteredBlog(this.blog) : super([blog]);

  final Blog blog;

  @override
  String toString() => 'UpdateFilteredBlog';
}

class FilterByTag extends FilteredBlogEvent {
  FilterByTag(this.tagFilter) : super([tagFilter]);

  final String tagFilter;

  @override
  String toString() => 'FilterByTag';
}

class ClearFilters extends FilteredBlogEvent {
  @override
  String toString() => 'ClearFilters';
}
