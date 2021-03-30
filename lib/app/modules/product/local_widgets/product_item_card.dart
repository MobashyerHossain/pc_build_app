import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
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
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: SizedBox(
            width: Get.width / 2.2,
            height: 200,
            child: GridTile(
              child: Stack(
                children: [
                  // Background Tile
                  Positioned(
                    right: 15,
                    bottom: 0,
                    child: Container(
                      height: 120,
                      width: Get.width / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: Get.isDarkMode
                              ? <Color>[
                                  Colors.white12,
                                  Colors.white54,
                                ]
                              : <Color>[
                                  Colors.black54,
                                  Colors.black26,
                                ],
                          tileMode: TileMode.repeated,
                        ),
                      ),
                    ),
                  ),
                  // Title
                  Positioned(
                    bottom: 5,
                    right: 20,
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
                    width: Get.width / 2.5 - 10,
                    child: Text(
                      product.getPrice(),
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.black87 : Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
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
