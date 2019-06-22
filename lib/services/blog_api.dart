import 'dart:convert';

import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:http/http.dart' as http;

class BlogApi {
  BlogApi(this.url);

  final String url;

  Future<Blog> fetchSummaryData() async {
    // TODO(Anyone): error handling
    final http.Response response = await http.get(
      Uri.encodeFull('assets/data/tags_test_data.json'),
    );
    final Map data = json.decode(response.body);
    final Blog blog = Blog.fromJson(data);
    return blog;
  }
}
