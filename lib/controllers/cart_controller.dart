import 'package:product_kart/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _cartProducts = {}.obs;
  var _cartProducts2 = <Product>[].obs;

  get cartProducts => _cartProducts;
  get cartProducts2 => _cartProducts2;

  void addToCart(Product product) {
    _cartProducts2.add(product);
    if (_cartProducts.containsKey(product)) {
      _cartProducts[product] += 1;
    } else {
      _cartProducts[product] = 1;
    }
  }

  void removeFromCart(Product product) {
    if (_cartProducts.containsKey(product) && _cartProducts[product] == 1) {
      _cartProducts.removeWhere((key, value) => key == product);
      _cartProducts2.remove(product);
    } else {
      _cartProducts[product] -= 1;
    }
  }

  void removeAll() {
    _cartProducts.clear();
    _cartProducts2.clear();
  }
}
