part of 'page_bloc.dart';

@freezed
abstract class PageEvent with _$PageEvent {
  const factory PageEvent.update(PageState page) = _Update;
}
