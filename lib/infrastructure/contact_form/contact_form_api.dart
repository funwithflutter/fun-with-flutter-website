import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ContactFormApi {
  ContactFormApi(this.uri);
  final String uri;

  Future<void> submitForm(String name, String replyTo, String message) async {
    final map = <String, String>{};
    map['name'] = name;
    map['_replyto'] = replyTo;
    map['message'] = message;
    try {
      await Dio().post<dynamic>(
        uri,
        data: map,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
    } catch (e) {
      debugPrint('erorr: $e');
      rethrow;
    }
  }
}
