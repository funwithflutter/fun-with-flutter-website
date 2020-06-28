part of 'blog_bloc.dart';

@freezed
abstract class BlogEvent with _$BlogEvent {
  const factory BlogEvent.fetch() = _Fetch;
}
