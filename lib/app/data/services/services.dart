import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class Services {
  static Future<void> init() async {
    await GetStorage.init().then((value) {
      Permission.storage.request().isGranted.then((value) {
        print('Services initiated');
        final _box = GetStorage();

        final _theme = 'isDarkMode';
        final _barIndex = 'bottomBarIndex';

        _box.writeIfNull(_theme, true);
        _box.writeIfNull(_barIndex, 1);
        print(_box.toString());
      });
    });

    // if (await Permission.storage.request().isGranted) {
    //   print('Services initiated');
    //   final _box = GetStorage();
    //   final _theme = 'isDarkMode';
    //   final _barIndex = 'bottomBarIndex';

    //   _box.write(_theme, true);
    //   _box.write(_barIndex, 1);
    //   print(_box.toString());
    // }
  }
}
