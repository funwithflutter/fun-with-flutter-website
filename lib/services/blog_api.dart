import 'dart:convert';

import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:http/http.dart' as http;

class BlogApi {
  final String url;

  BlogApi(this.url);

  Future<Blog> fetchSummaryData() async {
    //TODO error handling
    var blog;
    http.Response response = await http.get(
      Uri.encodeFull("assets/data/tags_test_data.json"),
    );
    Map data = json.decode(response.body);
    blog = Blog.fromJson(data);
    return blog;
  }
}
