mixin ProductSearchProvider {
  String siteUrl = '';
  String searchUrl = '';

  getSearchedProducts({
    required searchKey,
  }) async {
    return Future.value();
  }
}
