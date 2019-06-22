import 'dart:convert';
import 'package:http/http.dart' as http;

class BlogDataProvider {
  Future<Map> fetchData() async {
    final http.Response response = await http.get(
      Uri.encodeFull('assets/data/tags_test_data.json'),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('error fetching blog posts');
    }
  }
}
