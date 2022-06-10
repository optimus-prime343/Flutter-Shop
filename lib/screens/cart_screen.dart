import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/store/cart_store.dart';
import 'package:shop_app/widgets/cart/cart_list.dart';
import 'package:shop_app/widgets/ui/default_app_bar.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar('Your Cart', context),
        body: Consumer<CartStore>(
          builder: (context, data, child) => Column(
            children: [
              Expanded(
                child: CartList(
                  cartItems: data.cartItems,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price',
                      style: cartTotalText,
                    ),
                    Text(
                      '\$${data.totalPrice()}',
                      style: cartTotalText,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle cartTotalText = GoogleFonts.lato().copyWith(
  color: Colors.white,
  fontSize: 16,
);
