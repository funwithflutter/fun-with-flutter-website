import 'package:equatable/equatable.dart';
import 'package:fun_with_flutter/blocs/page/page_state.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => null;
}

class UpdatePage extends PageEvent {
  const UpdatePage(this.page);

  final PageState page;

  @override
  String toString() => 'UpdatePage {page: $page}';
}
