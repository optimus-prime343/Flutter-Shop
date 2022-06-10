import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/services/product_service.dart';

class ProductStore extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  List<Product> get products => _products;
  List<Product> get filteredProducts => _filteredProducts;
  List<String> get productCategories =>
      _products.map((product) => product.category).toSet().toList();

  Future<void> loadProducts() async {
    List<Product> fetchedProducts = await ProductService.getProducts();
    _products = fetchedProducts;
    notifyListeners();
  }

  void filterProductsByCategory(String category) {
    List<Product> filteredProductsByCategory = [..._products]
        .where((product) => product.category == category)
        .toList();
    _filteredProducts = filteredProductsByCategory;
    notifyListeners();
  }

  void clearFilteredProducts() {
    _filteredProducts = [];
    notifyListeners();
  }
}
