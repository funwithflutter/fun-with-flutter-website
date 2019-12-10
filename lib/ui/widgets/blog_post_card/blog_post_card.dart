import 'package:flutter/material.dart';
import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:fun_with_flutter/repository/url_repository.dart'
    as url_repository;
import 'package:fun_with_flutter/plugins/url_launcher/url_launcher.dart';

class BlogPostCard extends StatelessWidget {
  const BlogPostCard({Key key, this.post}) : super(key: key);
  final PostData post;

  @override
  Widget build(BuildContext context) {
    double width = 400;
    if (MediaQuery.of(context).size.width < 440) {
      width = MediaQuery.of(context).size.width * 80;
    }
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: () {
          UrlUtils.open(post.uri);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Column(
              children: <Widget>[
                Image.network(
                  url_repository.blogThumbnailUrl(post.thumbnail),
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    post?.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints:
                        const BoxConstraints(minHeight: 30, maxHeight: 60),
                    child: Wrap(
                      children: <Widget>[
                        Text(
                          post?.description,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
