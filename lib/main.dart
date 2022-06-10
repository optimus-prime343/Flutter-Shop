import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/favorite_products_screen.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/store/cart_store.dart';
import 'package:shop_app/store/product_store.dart';
import 'package:shop_app/store/user_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductStore>(
          create: (_) => ProductStore(),
        ),
        ChangeNotifierProvider<UserStore>(
          create: (_) => UserStore(),
        ),
        ChangeNotifierProvider<CartStore>(
          create: (_) => CartStore(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.indigo,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          FavoriteProductsScreen.routeName: (context) =>
              const FavoriteProductsScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
        },
      ),
    );
  }
}
