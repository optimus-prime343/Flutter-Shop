import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/store/product_store.dart';
import 'package:shop_app/widgets/product/product_list.dart';
import 'package:shop_app/widgets/ui/default_app_bar.dart';

import '../widgets/product/product_categories.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<ProductStore>(context, listen: false).loadProducts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar('Flutter Shop', context),
        body: Consumer<ProductStore>(
          builder: (context, data, child) => Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                child: ProductCategories(categories: data.productCategories),
              ),
              Expanded(
                child: ProductList(
                  products: data.filteredProducts.length > 1
                      ? data.filteredProducts
                      : data.products,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
