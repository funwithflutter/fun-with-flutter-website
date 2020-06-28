part of 'blog_bloc.dart';

@freezed
abstract class BlogState with _$BlogState {
  const factory BlogState.initial() = Initial;
  const factory BlogState.loading() = Loading;
  const factory BlogState.error() = Error;
  const factory BlogState.loaded(Blog blog, List<String> tags) = Loaded;
}

// @immutable
// abstract class BlogState {
//   const BlogState();
// }

// /// This is the default state
// class BlogLoading extends BlogState {
//   @override
//   String toString() => 'BlogLoading';
// }

// class BlogError extends BlogState {
//   @override
//   String toString() => 'BlogError';
// }

// class BlogLoaded extends BlogState {
//   const BlogLoaded(this.blog, this.tags) : super();

//   final Blog blog;
//   final List<String> tags;

//   @override
//   String toString() => 'BlogLoaded';
// }
