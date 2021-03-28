import 'package:get_storage/get_storage.dart';

class SiteChangeService {
  final _box = GetStorage();
  final _key = 'site';

  /// Get isDarkMode info from local storage and return ThemeMode
  get index => _loadIndexFromBox();

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  int _loadIndexFromBox() => _box.read(_key);

  /// Save isDarkMode to local storage
  _saveIndexToBox(int index) => _box.write(_key, index);

  /// Switch theme and save to local storage
  void switchIndex(index) {
    var i = 1;
    if (index != null) {
      i = index;
    }
    _saveIndexToBox(i);
  }
}
