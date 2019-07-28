import 'dart:html' as html;
import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:fun_with_flutter/repository/url_repository.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key key, this.post}) : super(key: key);
  final PostData post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        html.window.open(post.uri, post.title);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    post.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
                Divider(),
                Expanded(
                  child: Image.network(
                    blogThumbnailUrl(post.thumbnail),
                    fit: BoxFit.contain,
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints:
                        const BoxConstraints(minHeight: 20, maxHeight: 20),
                    child: Text(
                      post.description,
                      overflow: TextOverflow.ellipsis,
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
