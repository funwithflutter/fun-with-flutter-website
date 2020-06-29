import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/presentation/components/icon_bar.dart';
import 'package:fun_with_flutter/presentation/pages/home/components/sliver_course_header.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/blog/blog_bloc.dart';
import '../../core/themes.dart';
import '../../blog/blog_post_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;

  static const double _kScrollBodyWidth = 900;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (BuildContext context, BlogState state) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _kScrollBodyWidth),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: <Widget>[
                    const SliverSafeArea(
                      sliver: _SliverHeader(lable: 'Courses'),
                    ),
                    const SliverCourseHeader(),
                    const _SliverHeader(lable: 'Recent blog posts'),
                    _displayPosts(state, constraints.maxWidth),
                    const SliverToBoxAdapter(
                      child: IconBar(),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _displayPosts(BlogState state, double maxWidth) {
    return state.map(
      initial: (_) {
        return const _LoadingIndicator();
      },
      loading: (_) {
        return const _LoadingIndicator();
      },
      error: (_) {
        return const _NoBlogPosts();
      },
      loaded: (state) {
        return _BlogPosts(
          state: state,
          width: maxWidth,
        );
      },
    );
  }
}

class _SliverHeader extends StatelessWidget {
  const _SliverHeader({
    Key key,
    @required this.lable,
  }) : super(key: key);

  final String lable;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            lable,
            style: GoogleFonts.firaCode(fontSize: 32),
          ),
        ),
      ),
    );
  }
}

class _BlogPosts extends StatelessWidget {
  const _BlogPosts({Key key, @required this.state, @required this.width})
      : super(key: key);

  final Loaded state;
  final double width;

  static const double padding = 16;

  @override
  Widget build(BuildContext context) {
    int crossAxisCount;
    double crossAxisSpacing;
    double childAspectRation;

    final availableWidth = width - (padding * 2);

    if (availableWidth >= BlogPostCard.cardWidth * 2) {
      crossAxisCount = 2;
      crossAxisSpacing = availableWidth - (BlogPostCard.cardWidth * 2);
      childAspectRation = (availableWidth / 2) / BlogPostCard.cardHeight;
    } else {
      crossAxisCount = 1;
      crossAxisSpacing = 0;
      childAspectRation = availableWidth / BlogPostCard.cardHeight;
    }

    final _numberOfBlogsToLoad =
        (state.blog.pages.length >= 5) ? 6 : state.blog.pages.length;

    return SliverPadding(
      padding: const EdgeInsets.all(padding),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: 16,
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRation,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return BlogPostCard(
              key: ValueKey(state.blog.pages[index].title),
              post: state.blog.pages[index],
            );
          },
          childCount: _numberOfBlogsToLoad,
        ),
      ),
    );
  }
}

class _NoBlogPosts extends StatelessWidget {
  const _NoBlogPosts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text(
          'No blog content to show :(',
          style: TextStyle(fontSize: 18, color: AppTheme.errorColor),
        ),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
