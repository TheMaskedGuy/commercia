import 'package:product_kart/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _cartProducts = {}.obs;

  get cartProducts => _cartProducts;

  void addToCart(Product product) {
    if (_cartProducts.containsKey(product)) {
      _cartProducts[product] += 1;
    } else {
      _cartProducts[product] = 1;
    }
  }

  void removeFromCart(Product product) {
    if (_cartProducts.containsKey(product) && _cartProducts[product] == 1) {
      _cartProducts.removeWhere((key, value) => key == product);
    } else {
      _cartProducts[product] -= 1;
    }
  }

  void removeAll() {
    _cartProducts.clear();
  }
}
