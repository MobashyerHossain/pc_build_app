import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/page_change_indicator.dart';
import 'package:pc_build_app/app/modules/product/product_controller.dart';

class PageChanger extends StatelessWidget {
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: Get.height / 1.6,
          right: -23,
          child: Obx(
            () {
              if (controller.getNextPageAvailable()) {
                return PageChangeIndicator(
                  icon: Icons.keyboard_arrow_right,
                  pageChangeDirection: 'right',
                  controller: controller,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
        Positioned(
          top: Get.height / 1.6,
          left: -23,
          child: Obx(
            () {
              if (controller.getPrevPageAvailable()) {
                return PageChangeIndicator(
                  icon: Icons.keyboard_arrow_left,
                  pageChangeDirection: 'left',
                  controller: controller,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
