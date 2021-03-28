import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/data/services/site_change_service.dart';
import 'package:pc_build_app/app/global_controller/website_controller.dart';

class BottomNavBar extends StatelessWidget {
  final category;
  const BottomNavBar({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: GetX<WebsiteController>(
        init: WebsiteController(),
        builder: (_) {
          final sites = _.getWebSites();
          return CurvedNavigationBar(
            index: SiteChangeService().index == null
                ? 1
                : SiteChangeService().index,
            height: 50,
            backgroundColor: Get.isDarkMode
                ? MyColorTheme.dark.withOpacity(.5)
                : MyColorTheme.light,
            color: Get.isDarkMode
                ? MyColorTheme.light.withOpacity(.7)
                : MyColorTheme.dark,
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
              SiteChangeService().switchIndex(
                index,
              );
              _.setWebsite(sites[index], category);
            },
          );
        },
      ),
    );
  }
}
