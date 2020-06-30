import 'package:flutter/material.dart';

import '../../../../application/blog/blog_bloc.dart';
import '../../../blog/blog_post_card.dart';

class BlogPosts extends StatelessWidget {
  const BlogPosts({
    Key key,
    @required this.state,
    @required this.width,
    this.limitNumberOfBlogs,
  }) : super(key: key);

  final Loaded state;
  final double width;
  final int limitNumberOfBlogs;

  static const double padding = 16;

  int _numberOfBlogsToShow(int numberOfBlogsAvailable) {
    if (limitNumberOfBlogs == null) {
      return numberOfBlogsAvailable;
    }
    return (numberOfBlogsAvailable >= limitNumberOfBlogs)
        ? limitNumberOfBlogs
        : numberOfBlogsAvailable;
  }

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
          childCount: _numberOfBlogsToShow(state.blog.pages.length),
        ),
      ),
    );
  }
}

class NoBlogPosts extends StatelessWidget {
  const NoBlogPosts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text(
          'No blog content to show :(',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
