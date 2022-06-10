import 'package:flutter/material.dart';

import 'package:shop_app/models/cart.dart';

import '../models/product.dart';

enum CartQuantityAction {
  increase,
  decrease,
}

class CartStore extends ChangeNotifier {
  List<Cart> _cartItems = [];

  List<Cart> get cartItems => _cartItems;

  bool isProductInCart(int productId) {
    return _cartItems.any((cartItem) => cartItem.product.id == productId);
  }

  void removeFromCart(int productId) {
    List<Cart> newCartItems = _cartItems
        .where((cartItem) => cartItem.product.id != productId)
        .toList();
    _cartItems = newCartItems;
    notifyListeners();
  }

  void addToCart(Product product) {
    if (isProductInCart(product.id)) {
      return removeFromCart(product.id);
    }
    _cartItems = [Cart(product: product), ..._cartItems];
    notifyListeners();
  }

  void increaseCartQuantity(String cartId) {
    Cart cart = _cartItems.firstWhere((cartItem) => cartItem.id == cartId);
    if (cart.quantity < 10) {
      cart.quantity += 1;
      notifyListeners();
    }
  }

  void decreaseCartQuantity(String cartId) {
    Cart cart = _cartItems.firstWhere((cartItem) => cartItem.id == cartId);
    if (cart.quantity <= 1) return removeFromCart(cart.product.id);
    if (cart.quantity > 0) {
      cart.quantity -= 1;
      notifyListeners();
    }
  }

  double totalPrice() {
    return _cartItems.fold(
      0,
      (previousValue, cart) =>
          previousValue + (cart.quantity * cart.product.price),
    );
  }
}
