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
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Card(
          child: Container(
            width: 400,
            height: 400,
            child: Column(
              children: <Widget>[
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(post.content),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
