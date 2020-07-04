import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/page/page_bloc.dart';
import '../../common/error_widget.dart';
import '../../common/loading_indicator.dart';
import '../../pages/blog/blog_page.dart' deferred as blog;
import '../../pages/contact/contact_page.dart' deferred as contact;
import '../../pages/home/home_page.dart' deferred as home;

class AppPage extends StatelessWidget {
  const AppPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (BuildContext context, PageState state) {
        switch (state) {
          case PageState.home:
            // return const HomePage();
            return FutureBuilder<dynamic>(
              future: home.loadLibrary(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return home.HomePage();
                } else {
                  return const LoadingIndicator();
                }
              },
            );
            break;
          case PageState.blog:
            // return const FilteredBlogPage();
            return FutureBuilder<dynamic>(
              future: blog.loadLibrary(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return blog.FilteredBlogPage();
                } else {
                  return const LoadingIndicator();
                }
              },
            );
            break;
          case PageState.contact:
            // return const ContactUsPage();
            return FutureBuilder<dynamic>(
              future: contact.loadLibrary(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return contact.ContactUsPage();
                } else {
                  return const LoadingIndicator();
                }
              },
            );
            break;
          default:
            return const CustomError(
              errorMessage: '''
                  Whoops, you found something that should not exist. Or maybe it should and it's an error. Who knows?
                  ''',
            );
            break;
        }
      },
    );
  }
}
