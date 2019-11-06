import 'package:equatable/equatable.dart';
import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FilteredBlogEvent extends Equatable {
  const FilteredBlogEvent();

  @override
  List<Object> get props => null;
}

class UpdateFilteredBlog extends FilteredBlogEvent {
  const UpdateFilteredBlog(this.blog);

  final Blog blog;

  @override
  String toString() => 'UpdateFilteredBlog';
}

class FilterByTag extends FilteredBlogEvent {
  const FilterByTag(this.tagFilter);

  final String tagFilter;

  @override
  String toString() => 'FilterByTag';
}

class ClearFilters extends FilteredBlogEvent {
  @override
  String toString() => 'ClearFilters';
}
