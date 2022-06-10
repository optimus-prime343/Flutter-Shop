import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/store/product_store.dart';

class ProductCategories extends StatefulWidget {
  final List<String> categories;
  const ProductCategories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  int? _value;

  void handleChipSelected(bool selected, int index) {
    ProductStore productStore = Provider.of<ProductStore>(
      context,
      listen: false,
    );
    setState(() {
      _value = selected ? index : null;
    });
    if (_value == null) {
      productStore.clearFilteredProducts();
    } else {
      productStore.filterProductsByCategory(widget.categories[_value!]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final String category = widget.categories[index];
        return Consumer<ProductStore>(
          builder: (context, data, child) => ChoiceChip(
            label: Text(category),
            selected: _value == index,
            onSelected: (selected) => handleChipSelected(selected, index),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 15),
      itemCount: widget.categories.length,
    );
  }
}
