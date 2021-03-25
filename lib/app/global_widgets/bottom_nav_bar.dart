import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/global_controller/website_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<WebsiteController>(
      init: WebsiteController(),
      builder: (_) {
        final sites = _.getWebSites();
        return CurvedNavigationBar(
          height: 50,
          backgroundColor:
              Get.isDarkMode ? MyColorTheme.dark : MyColorTheme.light,
          color: Get.isDarkMode ? MyColorTheme.light : MyColorTheme.dark,
          items: <Widget>[
            for (var site in sites)
              Text(
                site.name.toUpperCase()[0],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:
                      Get.isDarkMode ? MyColorTheme.dark : MyColorTheme.light,
                ),
              ),
          ],
          onTap: (index) {
            _.setWebsite(sites[index]);
          },
        );
      },
    );
  }
}
