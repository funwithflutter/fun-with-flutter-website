import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_form_failure.freezed.dart';

@freezed
abstract class ContactFormFailure with _$ContactFormFailure {
  const factory ContactFormFailure.serverError() = ServerError;
}
