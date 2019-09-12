import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/ui/components/snackbar.dart';
import 'package:fun_with_flutter/ui/widgets/blog_post_card/blog_post_card.dart';
import 'package:fun_with_flutter/ui/widgets/error/error_widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          onPressed: () {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: const LoadingSnackbar(message: 'loading sample',)),
              );
          },
          child: const Text('show snackbar!'),
        ),
        _RecentBlogs(),
      ],
    );
  }
}

class _RecentBlogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (BuildContext context, BlogState state) {
        if (state is BlogLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is BlogLoaded) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: GridView.extent(
                maxCrossAxisExtent: 750,
                childAspectRatio: 3 / 2,
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  for (var page in state.blog.pages)
                    BlogPostCard(
                      post: page,
                    )
                ],
              ),
            ),
          );
        }
        return const CustomError(
          errorMessage: 'Blog data could not be loaded...',
        );
      },
    );
  }
}