import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pc_build_app/app/core/themes/app_theme.dart';
import 'package:pc_build_app/app/core/utils/dependency_injection.dart';
import 'package:pc_build_app/app/data/services/theme_services.dart';
import 'app/routes/app_pages.dart';

main() async {
  await GetStorage.init();
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme.light,
      darkTheme: MyAppTheme.dark,
      themeMode: ThemeService().theme,
      getPages: AppPages.pages,
      initialRoute: Routes.SPLASH,
    );
  }
}
