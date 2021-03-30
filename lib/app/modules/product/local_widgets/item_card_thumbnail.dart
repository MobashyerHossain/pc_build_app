import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pc_build_app/app/core/themes/color_theme.dart';

import 'package:pc_build_app/app/data/models/product_info_model.dart';

class ItemCardThumbnail extends StatelessWidget {
  const ItemCardThumbnail({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductInfoModel product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 10,
      child: Transform.rotate(
        angle: -0.3,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Get.isDarkMode
                    ? MyColorTheme.dark.withOpacity(.6)
                    : MyColorTheme.light.withOpacity(.6),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(-4, 4),
              ),
              BoxShadow(
                color: !Get.isDarkMode
                    ? MyColorTheme.dark.withOpacity(.6)
                    : MyColorTheme.light.withOpacity(.6),
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(-1, 1),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: CachedNetworkImage(
                    key: ValueKey(product.thumb),
                    imageUrl: product.thumb,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          color: !Get.isDarkMode
                              ? MyColorTheme.dark.withOpacity(.8)
                              : MyColorTheme.light.withOpacity(.8),
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
              Positioned(
                top: 0,
                right: 0,
                width: 100,
                height: 100,
                child: Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
