import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';

class SectionTitle extends StatelessWidget {
  final title;
  final alignment;
  final padding;
  final textSize;
  const SectionTitle({
    Key? key,
    this.title,
    this.alignment,
    this.padding,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: padding,
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
          color: Get.isDarkMode ? MyColorTheme.light : MyColorTheme.dark,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: textSize * 1.0,
            color: Get.isDarkMode ? MyColorTheme.dark : MyColorTheme.light,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
