import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';

class GradientContainer extends StatelessWidget {
  final child;
  const GradientContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: Get.isDarkMode
              ? <Color>[
                  MyColorTheme.dark.shade900,
                  MyColorTheme.dark.shade700,
                ]
              : <Color>[
                  MyColorTheme.light.shade100,
                  MyColorTheme.light.shade300,
                ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: child,
    );
  }
}
