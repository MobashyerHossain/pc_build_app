import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';

class SectionTitle extends StatelessWidget {
  final title;
  final alignment;
  final padding;
  final textSize;
  final thumb;
  SectionTitle({
    Key? key,
    this.title,
    this.alignment,
    this.padding,
    this.textSize,
    this.thumb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: padding,
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: Get.isDarkMode
                ? <Color>[
                    Colors.white12,
                    Colors.white54,
                  ]
                : <Color>[
                    Colors.black26,
                    Colors.black54,
                  ],
            tileMode: TileMode.repeated,
          ),
          // color: Get.isDarkMode
          //     ? MyColorTheme.light.withOpacity(.4)
          //     : MyColorTheme.dark.withOpacity(.5),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (thumb != null) thumb,
            if (title != null && thumb != null)
              SizedBox(
                width: 10,
              ),
            if (title != null)
              Text(
                title,
                style: TextStyle(
                  fontSize: textSize * 1.0,
                  color:
                      Get.isDarkMode ? MyColorTheme.dark : MyColorTheme.light,
                  fontWeight: FontWeight.w700,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
