import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:fun_with_flutter/services/blog_api.dart';

class BlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: BlogApi('assets/data/tags_test_data.json').fetchSummaryData(),
        builder: (context, AsyncSnapshot<Blog> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Input a URL to start');
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return const Text('');
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}',
                  style: TextStyle(color: Colors.red),
                );
              } else {
                return ListView(
                    children: <Widget>[Text(snapshot.data.tags[0].name)]);
              }
          }
        },
      )),
    );
  }
}
