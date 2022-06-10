import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';
import '../../store/cart_store.dart';
import 'cart_update_quantity_button.dart';

class CartItem extends StatelessWidget {
  final Cart cart;
  const CartItem({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartStore>(
      builder: (context, data, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            cart.product.image,
            width: 100,
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  cart.product.title,
                  style: GoogleFonts.lato().copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                '\$${cart.product.price}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Remove product from cart'),
                      content: Text(
                        'Are you sure you want to remove ${cart.product.title} from your cart ?',
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            data.removeFromCart(cart.product.id);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Confirm'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        )
                      ],
                    ),
                  );
                },
                child: const Text('Remove'),
              )
            ],
          ),
          Row(
            children: [
              CartUpdateQuantityButton(
                onPressed: () {
                  data.increaseCartQuantity(cart.id);
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                cart.quantity.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CartUpdateQuantityButton(
                onPressed: () {
                  data.decreaseCartQuantity(cart.id);
                },
                child: const Icon(
                  Icons.remove,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
