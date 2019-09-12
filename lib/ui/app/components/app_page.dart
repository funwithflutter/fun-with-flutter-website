import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/ui/screens/about/about_screen.dart';
import 'package:fun_with_flutter/ui/screens/blog/blog_screen.dart';
import 'package:fun_with_flutter/ui/screens/home/home_screen.dart';
import 'package:fun_with_flutter/ui/screens/packages/packages.dart';
import 'package:fun_with_flutter/ui/widgets/error/error_widget.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (BuildContext context, PageState state) {
        switch (state) {
          case PageState.home:
            return Expanded(child: Home());
            break;
          case PageState.tagsFilter:
            return Expanded(
              child: FilteredBlogPosts(),
            );
            break;
          case PageState.customWidgets:
            return PackagesPage();
            break;
          case PageState.about:
            return AboutScreen();
            break;
          default:
            return const Expanded(
              child: CustomError(
                errorMessage:
                    'Whoops, you found something that has not yet been implemented',
              ),
            );
            break;
        }
      },
    );
  }
}