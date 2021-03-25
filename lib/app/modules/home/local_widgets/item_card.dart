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
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              width: Get.width / 3,
              height: 60,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              category.name,
              style: TextStyle(
                color: Get.isDarkMode ? MyColorTheme.dark : MyColorTheme.light,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image(
              width: 80,
              image: AssetImage(category.thumb),
            ),
          ),
        ],
        clipBehavior: Clip.none,
        fit: StackFit.loose,
      ),
    );
  }
}
