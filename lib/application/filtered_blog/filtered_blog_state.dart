part of 'filtered_blog_bloc.dart';

@freezed
abstract class FilterBlogState with _$FilterBlogState {
  const factory FilterBlogState.error() = _Error;
  const factory FilterBlogState.loading() = _Loading;
  const factory FilterBlogState.loaded(Blog filteredBlog, String tagFilter) =
      _Loaded;
}
