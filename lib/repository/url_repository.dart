class UrlRepository {
  static const _blogTestingUrl = 'http://localhost:8000';
  static const _blogProdUrl = 'https://fun-with-blog.firebaseapp.com';

  static String blogBaseUrl() {
    String url = _blogProdUrl;
    assert(() {
      url = _blogTestingUrl;
      return true;
    }());
    return url;
  }

  static String blogDataUrl() {
    return '${blogBaseUrl()}/index.json';
  }
}
