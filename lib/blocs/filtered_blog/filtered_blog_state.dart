import 'package:equatable/equatable.dart';
import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FilteredBlogState extends Equatable {
  const FilteredBlogState();

  @override
  List<Object> get props => null;
}

class FilteredBlogError extends FilteredBlogState {
  @override
  String toString() => 'FilteredBlogError';
}

class FilteredBlogLoading extends FilteredBlogState {
  @override
  String toString() => 'FilteredBlogLoading';
}

class FilteredBlogLoaded extends FilteredBlogState {
  const FilteredBlogLoaded(this.filteredBlog, this.tagFilter);

  final Blog filteredBlog;
  final String tagFilter;

  @override
  String toString() {
    return 'FilteredBlogLoaded { filteredBlog: $filteredBlog, singleTagFilter: $tagFilter}';
  }
}
