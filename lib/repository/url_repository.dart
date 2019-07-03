const _blogTestingUrl = 'http://localhost:8000';
const _blogProdUrl = 'https://fun-with-blog.firebaseapp.com';
const _thumbnailPath = 'thumbnails';

String get blogBaseUrl {
  String url = _blogProdUrl;
  assert(() {
    url = _blogTestingUrl;
    return true;
  }());
  return url;
}

String get blogDataUrl {
  return '$blogBaseUrl/index.json';
}

String blogThumbnailUrl(String filename) {
  return '$blogBaseUrl/$_thumbnailPath/$filename';
}