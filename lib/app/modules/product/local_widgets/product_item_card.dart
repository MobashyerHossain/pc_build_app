import 'package:flutter/material.dart';
import 'package:pc_build_app/app/data/models/product_info_model.dart';

class ProductItemCard extends StatelessWidget {
  final ProductInfoModel product;
  const ProductItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(product.title),
    );
  }
}
