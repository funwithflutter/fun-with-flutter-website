import 'package:equatable/equatable.dart';
import 'package:fun_with_flutter/blocs/page/page_state.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageEvent extends Equatable {
  PageEvent([List props = const []]) : super(props);
}

class UpdatePage extends PageEvent {
  UpdatePage(this.page) : super([page]);

  final PageState page;

  @override
  String toString() => 'UpdatePage {page: $page}';
}
