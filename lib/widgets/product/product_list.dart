import 'package:flutter/material.dart';

import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/product/product_item.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 30,
      ),
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      itemBuilder: (context, index) {
        Product product = products[index];
        return ProductItem(product: product);
      },
    );
  }
}
