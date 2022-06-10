import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/favorite_products_screen.dart';
import 'package:shop_app/screens/home_screen.dart';

AppBar defaultAppBar(String title, BuildContext context) => AppBar(
      title: Text(title),
      leading: ModalRoute.of(context)?.settings.name == HomeScreen.routeName
          ? IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                ModalRoute.of(context)?.settings.name;
                Navigator.of(context)
                    .pushNamed(FavoriteProductsScreen.routeName);
              },
            )
          : IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
              icon: const Icon(Icons.home),
            ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
          icon: const Icon(Icons.shopping_cart),
        )
      ],
    );
