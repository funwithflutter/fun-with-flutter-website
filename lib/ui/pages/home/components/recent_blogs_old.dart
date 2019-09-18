import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/ui/widgets/blog_post_card/blog_post_card.dart';
import 'package:fun_with_flutter/ui/widgets/error/error_widget.dart';

class RecentBlogs extends StatelessWidget {
  const RecentBlogs({Key key, this.numberOfPosts = 4})
      : assert(numberOfPosts != null && numberOfPosts > 0), // TODO(Gordon): use or lose
        super(key: key);

  final int numberOfPosts;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (BuildContext context, BlogState state) {
        // if (state is BlogLoading) {
        //   return Center(
        //     child: const CircularProgressIndicator(),
        //   );
        // }
        if (state is BlogLoaded) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Recent Blogs',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              Expanded(
                child: GridView.extent(
                  maxCrossAxisExtent: 750,
                  childAspectRatio: 3 / 2,
                  padding: const EdgeInsets.all(16),
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    for (var i = 0; i < state.blog.pages.length; i++)
                      BlogPostCard(
                        post: state.blog.pages[i],
                      )
                  ],
                ),
              ),
            ],
          );
        }
        return const CustomError(
          errorMessage: 'Blog data could not be loaded...',
        );
      },
    );
  }
}
