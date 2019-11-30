import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FilteredBlogEvent {
  FilteredBlogEvent();
}

class UpdateFilteredBlog extends FilteredBlogEvent {
  UpdateFilteredBlog(this.blog);

  final Blog blog;

  @override
  String toString() => 'UpdateFilteredBlog';
}

class FilterByTag extends FilteredBlogEvent {
  FilterByTag(this.tagFilter);

  final String tagFilter;

  @override
  String toString() => 'FilterByTag';
}

class ClearFilters extends FilteredBlogEvent {
  @override
  String toString() => 'ClearFilters';
}
