import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  /// Get isDarkMode info from local storage and return ThemeMode
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  /// Save isDarkMode to local storage
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
    Future.delayed(
      Duration(seconds: 2),
    );
  }
}

class BottomBarService {
  final _box = GetStorage();
  final _key = 'index';

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
    Future.delayed(
      Duration(milliseconds: 200),
    );
  }
}
