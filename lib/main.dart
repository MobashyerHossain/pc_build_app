import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/app_theme.dart';
import 'package:pc_build_app/app/core/utils/dependency_injection.dart';
import 'app/routes/app_pages.dart';

void main() {
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme().lightTheme,
      darkTheme: MyAppTheme().darkTheme,
      themeMode: ThemeMode.dark,
      getPages: AppPages.pages,
      initialRoute: Routes.SPLASH,
    );
  }
}
