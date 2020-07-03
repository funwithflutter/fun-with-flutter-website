import 'package:dartz/dartz.dart';

import 'contact_form.dart';
import 'contact_form_failure.dart';

abstract class IContactFormRepository {
  Future<Either<ContactFormFailure, Unit>> submitForm(ContactForm contact);
}
