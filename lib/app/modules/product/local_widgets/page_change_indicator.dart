import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';

class PageChangeIndicator extends StatelessWidget {
  final icon;
  final pageChangeDirection;
  final controller;
  final borderRadius;
  const PageChangeIndicator({
    Key? key,
    this.icon,
    this.pageChangeDirection,
    this.controller,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dance(
      child: BounceInUp(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Get.isDarkMode ? MyColorTheme.light : MyColorTheme.dark,
          ),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: pageChangeDirection == 'left'
                ? Alignment.centerRight
                : Alignment.centerLeft,
            icon: Icon(
              icon,
              size: 30,
              color: Get.isDarkMode ? MyColorTheme.dark : MyColorTheme.light,
            ),
            onPressed: () {
              // ProductsPageSplashScreen(context);
              controller.pageChange(pageChangeDirection);
            },
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void ProductsPageSplashScreen(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(
          seconds: 3,
        ),
        backgroundColor: Get.isDarkMode
            ? MyColorTheme.dark.withOpacity(0.6)
            : MyColorTheme.light.withOpacity(0.6),
        content: Container(
          decoration: BoxDecoration(
              // color:
              ),
          child: Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? MyColorTheme.light : MyColorTheme.dark,
            ),
          ),
        ),
      ),
    );
  }
}
