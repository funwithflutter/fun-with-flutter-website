import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../domain/blog/blog.dart';
import 'blog_post_card.dart';
import 'tag_widgets.dart';

class BlogPosts extends StatelessWidget {
  const BlogPosts({
    Key key,
    @required this.blog,
    @required this.width,
    @required this.maxWidth,
    @required this.onTagTap,
    this.limitNumberOfBlogs,
  }) : super(key: key);

  final Blog blog;
  final double width;
  final double maxWidth;
  final int limitNumberOfBlogs;
  final OnTagTap onTagTap;

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
    double childAspectRation;

    final padding = (maxWidth - width) / 2;

    if (maxWidth >= BlogPostCard.cardWidth * 2) {
      crossAxisCount = 2;
      childAspectRation = (width / 2) / BlogPostCard.cardHeight;
    } else {
      crossAxisCount = 1;
      childAspectRation = width / BlogPostCard.cardHeight;
    }
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          mainAxisSpacing: 16,
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRation,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return BlogPostCard(
              key: ValueKey(blog.pages[index].title),
              post: blog.pages[index],
              onTagTap: onTagTap,
            );
          },
          childCount: _numberOfBlogsToShow(blog.pages.length),
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Text(
            'No blog content to show :(',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
