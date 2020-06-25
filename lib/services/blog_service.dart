import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

@immutable
class BlogApi {
  const BlogApi({@required this.uri});

  final String uri;

  Future<Map<String, dynamic>> fetchData() async {
    final http.Response response = await http.get(
      Uri.encodeFull(uri),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> result =
          json.decode(response.body) as Map<String, dynamic>;
      return result;
    } else {
      throw Exception(
          'Error fetching blog posts: ${response.statusCode} ${response.statusCode}');
    }
  }
}
