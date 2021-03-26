import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/data/models/category_model.dart';

class ItemCard extends StatelessWidget {
  final CategoryModel category;
  const ItemCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GridTile(
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: Get.isDarkMode
                      ? <Color>[
                          Colors.white70,
                          Colors.white24,
                        ]
                      : <Color>[
                          Colors.black54,
                          Colors.black26,
                        ],
                  tileMode: TileMode.repeated,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              width: Get.width / 3,
              height: 80,
            ),
          ),
          Positioned(
            width: Get.width / 3 - 10,
            bottom: 10,
            left: 10,
            child: Text(
              category.name,
              style: TextStyle(
                color: Get.isDarkMode ? MyColorTheme.dark : MyColorTheme.light,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
          ),
          Positioned(
            right: 0,
            top: 20,
            child: Image(
              image: ResizeImage(
                AssetImage(category.thumb),
                width: 120,
                height: 120,
              ),
            ),
          ),
        ],
        clipBehavior: Clip.none,
        fit: StackFit.loose,
      ),
    );
  }
}
