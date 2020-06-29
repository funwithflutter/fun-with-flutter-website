import 'package:flutter/material.dart';

import '../../domain/blog/post_data.dart';
import '../../infrastructure/url_repository.dart' as url_repository;
import '../utils/url_handler.dart';

class BlogPostCard extends StatelessWidget {
  const BlogPostCard({Key key, this.post}) : super(key: key);
  final PostData post;

  static const double _cardWidth = 400;
  static double get cardWidth => _cardWidth;
  static const double _cardHeight = 430;
  static double get cardHeight => _cardHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          launchURL(post.uri);
        },
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: _cardWidth,
              maxHeight: _cardHeight,
              minHeight: _cardHeight,
            ),
            child: Card(
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(
                      url_repository.blogThumbnailUrl(post.thumbnail),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      post?.title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      post?.description,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: const [
                      _Tag(),
                      _Tag(),
                      _Tag(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.red[100],
      ),
      height: 30,
      child: const Text('Firebase'),
    );
  }
}
