import 'package:uuid/uuid.dart';

import 'product.dart';

class Cart {
  final String id = const Uuid().v4();
  final Product product;
  int quantity;

  Cart({
    required this.product,
    this.quantity = 1,
  });
}
