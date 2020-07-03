part of 'filtered_blog_bloc.dart';

@freezed
abstract class FilterBlogEvent with _$FilterBlogEvent {
  const factory FilterBlogEvent.update(Blog blog) = _Update;
  const factory FilterBlogEvent.filterByTag(String tag) = _FilterByTag;
  const factory FilterBlogEvent.clearFilters() = _ClearFilters;
  const factory FilterBlogEvent.errorFromBlog() = _ErrorFromBlog;
}

// @immutable
// abstract class FilteredBlogEvent {
//   const FilteredBlogEvent();
// }

// class UpdateFilteredBlog extends FilteredBlogEvent {
//   const UpdateFilteredBlog(this.blog);

//   final Blog blog;

//   @override
//   String toString() => 'UpdateFilteredBlog';
// }

// class FilterByTag extends FilteredBlogEvent {
//   const FilterByTag(this.tagFilter);

//   final String tagFilter;

//   @override
//   String toString() => 'FilterByTag';
// }

// class ClearFilters extends FilteredBlogEvent {
//   @override
//   String toString() => 'ClearFilters';
// }
