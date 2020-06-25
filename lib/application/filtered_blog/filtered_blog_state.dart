import 'package:meta/meta.dart';

import '../../domain/blog/blog.dart';

@immutable
abstract class FilteredBlogState  {
  const FilteredBlogState();
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
