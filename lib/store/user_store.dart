import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/product.dart';

class UserStore extends ChangeNotifier {
  List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  bool isFavorite(int productId) {
    return _favoriteProducts.any((product) => product.id == productId);
  }

  void removeFromFavorite(int productId) {
    List<Product> newFavoriteProducts =
        _favoriteProducts.where((product) => product.id != productId).toList();
    _favoriteProducts = newFavoriteProducts;
    notifyListeners();
  }

  void addToFavorite(Product product) {
    if (isFavorite(product.id)) {
      return removeFromFavorite(product.id);
    }
    _favoriteProducts = [product, ..._favoriteProducts];
    notifyListeners();
  }
}
