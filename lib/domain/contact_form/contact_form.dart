import 'package:freezed_annotation/freezed_annotation.dart';

import 'value_objects.dart';

part 'contact_form.freezed.dart';

@freezed
abstract class ContactForm with _$ContactForm {
  const factory ContactForm(Name name, ReplyTo replyTo, Message message) =
      _ContactForm;
}
