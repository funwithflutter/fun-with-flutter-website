part of 'filtered_blog_bloc.dart';

@freezed
abstract class FilterBlogState with _$FilterBlogState {
  const factory FilterBlogState.error() = _Error;
  const factory FilterBlogState.loading() = _Loading;
  const factory FilterBlogState.loaded(Blog filteredBlog, String tagFilter) =
      _Loaded;
}

// @immutable
// abstract class FilteredBlogState  {
//   const FilteredBlogState();
// }

// class FilteredBlogError extends FilteredBlogState {
//   @override
//   String toString() => 'FilteredBlogError';
// }

// class FilteredBlogLoading extends FilteredBlogState {
//   @override
//   String toString() => 'FilteredBlogLoading';
// }

// class FilteredBlogLoaded extends FilteredBlogState {
//   const FilteredBlogLoaded(this.filteredBlog, this.tagFilter);

//   final Blog filteredBlog;
//   final String tagFilter;

//   @override
//   String toString() {
//     return 'FilteredBlogLoaded { filteredBlog: $filteredBlog, singleTagFilter: $tagFilter}';
//   }
// }
