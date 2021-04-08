import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
import 'package:pc_build_app/app/global_widgets/gradient_card.dart';
import 'package:pc_build_app/app/modules/product/local_widgets/item_card_thumbnail.dart';

class ProductItemCard extends StatelessWidget {
  final ProductInfoModel product;
  const ProductItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        alignment: Alignment.centerLeft,
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
            width: Get.width / 2.2,
            height: Get.width / 2.2,
            child: GridTile(
              child: Stack(
                children: [
                  // Background Tile
                  Positioned(
                    right: 15,
                    bottom: 0,
                    child: GradientCard(
                      height: Get.width / 4,
                      width: Get.width / 2.5,
                    ),
                  ),
                  // Title
                  Positioned(
                    bottom: 5,
                    left: 15,
                    width: Get.width / 2.5 - 10,
                    child: Text(
                      product.title,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Get.isDarkMode
                            ? MyColorTheme.dark
                            : MyColorTheme.light,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  // Price
                  Positioned(
                    bottom: 60,
                    left: 15,
                    width: Get.width / 2.5,
                    child: Text(
                      product.getPrice(),
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.black87 : Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  // Thumbnail
                  ItemCardThumbnail(product: product),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
