import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/ui/pages/about/about_page.dart';
import 'package:fun_with_flutter/ui/pages/blog/blog_page.dart';
import 'package:fun_with_flutter/ui/pages/home/home_page.dart';
import 'package:fun_with_flutter/ui/pages/packages/packages_page.dart';
import 'package:fun_with_flutter/ui/widgets/error/error_widget.dart';

class AppPage extends StatelessWidget {

  const AppPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (BuildContext context, PageState state) {
        switch (state) {
          case PageState.home:
            return HomePage();
            break;
          case PageState.blog:
            return FilteredBlogPage();
            break;
          case PageState.packages:
            return PackagesPage();
            break;
          case PageState.about:
            return AboutPage();
            break;
          default:
            return const CustomError(
              errorMessage:
                  'Whoops, you found something that has not yet been implemented',
            );
            break;
        }
      },
    );
  }
}
