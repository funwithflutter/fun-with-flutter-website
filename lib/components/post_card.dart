import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/models/blog_model.dart';

class PostCard extends StatefulWidget {
  PostCard({Key key, this.post}) : super(key: key);

  final PostData post;

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  double padding = 16;

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    return GestureDetector(
      onTap: () {
        print('Go to page'); // TODO(Anyone): go to page
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          padding = 24;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          padding = 16;
        });
      },
      child: AnimatedPadding(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeIn,
        padding: EdgeInsets.all(padding),
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
                    'http://localhost:1313/${post.thumbnail}',
                    fit: BoxFit.contain,
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 20, maxHeight: 20),
                    child: Text(
                      post.content,
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
