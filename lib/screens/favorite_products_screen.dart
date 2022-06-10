import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/store/user_store.dart';
import 'package:shop_app/widgets/product/product_list.dart';

import '../widgets/ui/default_app_bar.dart';

class FavoriteProductsScreen extends StatelessWidget {
  static const routeName = '/favorites';
  const FavoriteProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar('Favorite Products', context),
        body: Consumer<UserStore>(
          builder: (context, data, child) => data.favoriteProducts.isEmpty
              ? const Text('No favorite Products yet')
              : ProductList(products: data.favoriteProducts),
        ),
      ),
    );
  }
}
