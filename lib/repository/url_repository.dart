import 'package:fun_with_flutter/utils/urls.dart' as url;

const _thumbnailUrlPath = 'thumbnails';


String get blogBaseUrl {
  if (_isReleaseBuild()) {
    return url.blogProductionUrl;
  }
  return url.blogTestingUrl;
}

String get blogDataUrl {
  return '$blogBaseUrl/index.json';
}

String blogThumbnailUrl(String filename) {
  return '$blogBaseUrl/$_thumbnailUrlPath/$filename';
}

bool _isReleaseBuild() {
  var isProd = true;
  assert(() {
    isProd = false;
    return true;
  }());
  return isProd;
}
