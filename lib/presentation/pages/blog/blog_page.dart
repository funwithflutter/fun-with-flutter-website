import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/blog/blog_bloc.dart';
import '../../common/info_bar.dart';
import '../../common/sliver_header.dart';
import '../../common/sliver_loading_indicator.dart';
import '../../core/constants.dart';
import 'widgets/blog_posts.dart';

class FilteredBlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (BuildContext context, BlogState state) {
        return Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Scrollbar(
                child: CustomScrollView(
                  slivers: <Widget>[
                    const SliverSafeArea(
                      sliver: SliverHeader(lable: 'Courses'),
                    ),
                    _displayPosts(
                      state,
                      constraints.maxWidth > kMaxBodyWidth
                          ? kMaxBodyWidth
                          : constraints.maxWidth,
                      constraints.maxWidth,
                    ),
                    const SliverBottomInfoBar()
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _displayPosts(BlogState state, double width, double maxWidth) {
    return state.map(
      initial: (_) {
        return const SliverLoadingIndicator();
      },
      loading: (_) {
        return const SliverLoadingIndicator();
      },
      error: (_) {
        return const NoBlogPosts();
      },
      loaded: (state) {
        return BlogPosts(
          blog: state.blog,
          width: width,
          maxWidth: maxWidth,
        );
      },
    );
  }
}
