import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';

class GradientCard extends StatelessWidget {
  final height;
  final width;
  const GradientCard({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: Get.isDarkMode
              ? <Color>[
                  MyColorTheme.light.shade400,
                  MyColorTheme.light.shade200,
                ]
              : <Color>[
                  MyColorTheme.dark.shade400,
                  MyColorTheme.dark.shade200,
                ],
          tileMode: TileMode.repeated,
        ),
      ),
    );
  }
}
