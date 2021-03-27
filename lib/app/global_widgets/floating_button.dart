import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/data/services/theme_service.dart';

class FloatingButton extends StatelessWidget {
  final fabKey;
  const FloatingButton({
    Key? key,
    this.fabKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
      key: fabKey,
      animationDuration: Duration(
        milliseconds: 400,
      ),
      fabElevation: 10,
      alignment: Alignment.bottomRight,
      ringColor: Get.isDarkMode
          ? MyColorTheme.light.withOpacity(0.8)
          : MyColorTheme.dark.withOpacity(0.8),
      ringWidth: 50,
      ringDiameter: 300,
      fabColor: Get.isDarkMode
          ? MyColorTheme.light.withOpacity(0.8)
          : MyColorTheme.dark.withOpacity(0.8),
      fabCloseIcon: Icon(
        Icons.close,
        color: Get.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
        size: 30,
      ),
      fabOpenIcon: Icon(
        Icons.menu,
        color: Get.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
        size: 30,
      ),
      children: <Widget>[
        IconButton(
          icon: Icon(
            Get.isDarkMode ? Icons.wb_sunny : Icons.nights_stay,
            size: 30,
            color: Get.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
          ),
          onPressed: () {
            ThemeService().switchTheme();
            if (fabKey.currentState!.isOpen) {
              fabKey.currentState!.close();
            }
          },
        ),
        IconButton(
          icon: Icon(
            Icons.streetview,
            size: 30,
            color: Get.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
          ),
          onPressed: () {
            if (fabKey.currentState!.isOpen) {
              fabKey.currentState!.close();
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.transparent,
                behavior: SnackBarBehavior.fixed,
                duration: Duration(
                  seconds: 3,
                ),
                padding: EdgeInsets.all(0),
                content: Container(
                  height: 200,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color:
                        Get.isDarkMode ? MyColorTheme.light : MyColorTheme.dark,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
