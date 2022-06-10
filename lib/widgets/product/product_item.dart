import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/store/cart_store.dart';
import 'package:shop_app/store/user_store.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          product.image,
          height: 150,
          width: 150,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                '\$${product.price.toStringAsPrecision(2)}',
                style: GoogleFonts.lato().copyWith(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 6.0),
              Chip(
                label: Text(product.category),
              ),
              Consumer<UserStore>(
                builder: (context, data, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<CartStore>(
                      builder: (context, data, child) => TextButton(
                        style: TextButton.styleFrom(
                          primary: data.isProductInCart(product.id)
                              ? Colors.red
                              : Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          data.addToCart(product);
                        },
                        child: Text(
                          data.isProductInCart(product.id)
                              ? 'Remove from cart'
                              : 'Add to cart',
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: data.isFavorite(product.id)
                          ? 'Remove from favorite'
                          : 'Add to favorite',
                      onPressed: () => data.addToFavorite(product),
                      icon: Icon(
                        data.isFavorite(product.id)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
