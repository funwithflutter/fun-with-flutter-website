import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/page/page_bloc.dart';
import '../../common/error_widget.dart';
import '../../pages/blog/blog_page.dart';
import '../../pages/contact/contact_page.dart';
import '../../pages/home/home_page.dart';

class AppPage extends StatelessWidget {
  const AppPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (BuildContext context, PageState state) {
        switch (state) {
          case PageState.home:
            return const HomePage();
            break;
          case PageState.blog:
            return const FilteredBlogPage();
            break;
          case PageState.contact:
            return const ContactUsPage();
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
