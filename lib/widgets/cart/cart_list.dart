import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/widgets/cart/cart_item.dart';

class CartList extends StatelessWidget {
  final List<Cart> cartItems;
  const CartList({
    Key? key,
    required this.cartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) => CartItem(
        cart: cartItems[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 30),
      itemCount: cartItems.length,
    );
  }
}
