import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/contact_form/bloc/contact_form_bloc.dart';
import '../../../common/accent_button.dart';
import '../../../core/constants.dart';
import '../../../core/extensions.dart';
import '../../../core/notification_helper.dart';

class ContactUsForm extends StatelessWidget {
  const ContactUsForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactFormBloc, ContactFormState>(
      listener: (context, state) => state.submitFailureOrSuccessOption.fold(
        () => () {},
        (either) => either.fold(
          (failure) => NotificationHelper.error(
            message: failure.map(serverError: (_) => 'Server error'),
            isPhone: isPhoneSize(context.mediaSize),
          ).show(context),
          (_) => NotificationHelper.success(
            message: 'Form submitted successfully',
            isPhone: isPhoneSize(context.mediaSize),
          ).show(context),
        ),
      ),
      builder: (context, state) {
        final submitted =
            state.submitFailureOrSuccessOption.fold(() => false, (a) => true);
        if (submitted) {
          return const _FormSubmittedSuccess();
        }
        return Container(
          padding: const EdgeInsets.all(8),
          color: Theme.of(context).colorScheme.surface,
          child: Form(
            autovalidate: state.showErrorMessages,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Reply to',
                    border: OutlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(),
                  ),
                  autocorrect: false,
                  onChanged: (value) => context
                      .bloc<ContactFormBloc>()
                      .add(ContactFormEvent.emailChanged(value)),
                  validator: (_) =>
                      context.bloc<ContactFormBloc>().state.replyTo.value.fold(
                            (f) => f.maybeMap(
                              invalidEmail: (_) => 'Invalid Email',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.face),
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(),
                  ),
                  onChanged: (value) => context
                      .bloc<ContactFormBloc>()
                      .add(ContactFormEvent.nameChanged(value)),
                  validator: (_) => context
                      .bloc<ContactFormBloc>()
                      .state
                      .name
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          exceedingLength: (_) => 'Input too long',
                          empty: (_) => 'Input required',
                          multiline: (_) => 'Input cannot be multiple lines',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.message),
                    labelText: 'Message',
                    border: OutlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(),
                  ),
                  onChanged: (value) => context
                      .bloc<ContactFormBloc>()
                      .add(ContactFormEvent.messageChanged(value)),
                  validator: (_) =>
                      context.bloc<ContactFormBloc>().state.message.value.fold(
                            (f) => f.maybeMap(
                              exceedingLength: (_) => 'Input too long',
                              empty: (_) => 'Input required',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                ),
                const SizedBox(height: 8),
                AccentButton(
                  onPressed: () {
                    context
                        .bloc<ContactFormBloc>()
                        .add(const ContactFormEvent.submit());
                  },
                  label: 'SUBMIT',
                ),
                if (state.isSubmitting) ...[
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FormSubmittedSuccess extends StatelessWidget {
  const _FormSubmittedSuccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Thank you! We will get back to you as soon as possible.'),
        Text('Alternatively, contact us directly at funwithflutter@gmail.com'),
      ],
    );
  }
}
