part of 'contact_form_bloc.dart';

@freezed
abstract class ContactFormEvent with _$ContactFormEvent {
  const factory ContactFormEvent.nameChanged(String name) = _NameChanged;
  const factory ContactFormEvent.emailChanged(String email) = _EmailChanged;
  const factory ContactFormEvent.messageChanged(String message) =
      _MessageChanged;
  const factory ContactFormEvent.submit() = _Submit;
}
