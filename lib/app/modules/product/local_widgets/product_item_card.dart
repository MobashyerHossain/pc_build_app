import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';
import 'dart:math' as math;

class ProductItemCard extends StatelessWidget {
  final ProductInfoModel product;
  const ProductItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: FadeInUp(
              duration: Duration(
                milliseconds: 500,
              ),
              child: Container(
                height: 90,
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
                            Colors.white70,
                            Colors.white24,
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
          ),
          Positioned(
            bottom: 45,
            left: 5,
            width: Get.width / 2.5 - 10,
            child: BounceInDown(
              delay: Duration(milliseconds: 600),
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
          ),
          Positioned(
            bottom: 5,
            left: 5,
            width: Get.width / 2.5 - 10,
            child: Text(
              product.title.trim(),
              style: TextStyle(
                color: Get.isDarkMode ? MyColorTheme.dark : MyColorTheme.light,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            height: 100,
            width: 100,
            child: Spin(
              child: Transform.rotate(
                angle: -math.pi / 11,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.thumb,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ResizeImage(
                              imageProvider,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      );
                    },
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            width: 100,
            height: 100,
            child: BounceInDown(
              delay: Duration(milliseconds: 500),
              child: Transform.rotate(
                angle: -math.pi / 11,
                // angle: 0,
                child: product.spacialNote.isNotEmpty
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 25,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(18),
                              // bottomRight: Radius.circular(20),
                            ),
                            color: Colors.red.withOpacity(.7),
                          ),
                          child: Text(
                            product.spacialNote,
                            style: TextStyle(
                              color: Get.isDarkMode
                                  ? MyColorTheme.light
                                  : MyColorTheme.dark,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
