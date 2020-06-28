import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/blog/blog.dart';
import '../../domain/blog/i_blog_repository.dart';
import '../../domain/blog/tag.dart';

part 'blog_bloc.freezed.dart';
part 'blog_event.dart';
part 'blog_state.dart';

@injectable
class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc(this._blogRepository);

  final IBlogRepository _blogRepository;

  @override
  BlogState get initialState {
    return const BlogState.initial();
  }

  @override
  Stream<BlogState> mapEventToState(
    BlogEvent event,
  ) async* {
    yield const BlogState.loading();
    yield* event.map(fetch: (e) async* {
      // try {
      final blogOption = await _blogRepository.getBlogData();
      yield blogOption.fold(
        (e) => const BlogState.error(),
        (blog) {
          final List<String> tags =
              blog.tags.map((Tag tag) => tag.name).toList();
          return BlogState.loaded(blog, tags);
        },
      );
      // final List<String> tags = blog.tags.map((Tag tag) => tag.name).toList();
      // yield BlogState.loaded(blog, tags);
      //   return;
      // } catch (_) {
      //   yield const BlogState.error();
      // }
    });
  }
}
