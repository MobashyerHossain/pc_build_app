import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? MyColorTheme.dark.withOpacity(0.6)
            : MyColorTheme.light.withOpacity(0.6),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Search',
            labelStyle: TextStyle(
              color: Get.isDarkMode ? MyColorTheme.light : MyColorTheme.dark,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Get.isDarkMode ? MyColorTheme.light : MyColorTheme.dark,
              ),
            ),
            alignLabelWithHint: true,
            hintText: 'Product',
            hintStyle: TextStyle(
              color: Get.isDarkMode
                  ? MyColorTheme.light.withOpacity(.5)
                  : MyColorTheme.dark.withOpacity(.5),
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
