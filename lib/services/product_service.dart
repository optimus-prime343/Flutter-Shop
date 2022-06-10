import 'package:dio/dio.dart';
import 'package:shop_app/models/product.dart';

const String _productApiBaseUrl = 'https://fakestoreapi.com/products';

class ProductService {
  static Future<List<Product>> getProducts() async {
    Response response = await Dio().get(_productApiBaseUrl);
    List<dynamic> productsJson = response.data;
    List<Product> products = productsJson
        .map(
          (productJson) => Product.fromJson(productJson),
        )
        .toList();
    return products;
  }
}
