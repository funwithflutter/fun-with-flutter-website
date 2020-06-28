import 'package:injectable/injectable.dart';

import '../core/urls.dart';

@dev
@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  @Named("BaseUrl")
  String get baseUrl => blogTestingUrl + '/index.json';

  // // url here will be injected
  // @lazySingleton
  // Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));

  // // same thing works for instances that's gotten asynchronous.
  // // all you need to do is wrap your instance with a future and tell injectable how
  // // to initialize it
  // @preResolve // if you need to  pre resolve the value
  // Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  // // Also make sure you await for your configure function before running the App.

}
