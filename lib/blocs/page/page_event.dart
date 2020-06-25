import 'package:meta/meta.dart';

import 'page_state.dart';

@immutable
abstract class PageEvent {
  const PageEvent();
}

class UpdatePage extends PageEvent {
  const UpdatePage(this.page);

  final PageState page;

  @override
  String toString() => 'UpdatePage {page: $page}';
}
