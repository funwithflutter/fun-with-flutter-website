import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/models/blog_model.dart';

class PostCard extends StatefulWidget {
  final PostData post;

  PostCard({Key key, this.post}) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  double padding = 16;

  @override
  Widget build(BuildContext context) {
    var post = widget.post;
    return GestureDetector(
      onTap: () {
        print('Go to page'); // TODO go to page
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
      child: Card(
        child: Container(
          width: 400,
          height: 400,
          child: Padding(
            padding: EdgeInsets.all(padding),
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
