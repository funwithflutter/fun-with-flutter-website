import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/contact_form/contact_form.dart';
import '../../domain/contact_form/contact_form_failure.dart';
import '../../domain/contact_form/i_contact_form_repository.dart';
import 'contact_form_api.dart';

@Injectable(as: IContactFormRepository)
class ContactFormRepository implements IContactFormRepository {
  final ContactFormApi _api = ContactFormApi('https://formspree.io/xyynnggq');

  @override
  Future<Either<ContactFormFailure, Unit>> submitForm(
      ContactForm contact) async {
    final String name = contact.name.getOrCrash();
    final String replyTo = contact.replyTo.getOrCrash();
    final String message = contact.message.getOrCrash();

    try {
      await _api.submitForm(name, replyTo, message);
      return right(unit);
    } catch (e) {
      return left(const ContactFormFailure.serverError());
    }
  }
}
