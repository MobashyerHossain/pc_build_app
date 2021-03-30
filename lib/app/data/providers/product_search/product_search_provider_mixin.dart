mixin ProductSearchProvider {
  String siteUrl = '';
  String searchUrl = '';

  getSearchResult({
    required searchKey,
  }) async {
    return Future.value();
  }
}
