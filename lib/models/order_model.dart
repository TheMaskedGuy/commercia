import 'package:product_kart/models/product_model.dart';

class Order {
  final int id;
  final List<Product> products;

  Order({required this.id, required this.products});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json['id'], products: Product.fromJsonArray(json['products']));
  }

  static Map<String, Object?> toJson(List<Map> order) {
    return {'id': 4, 'products': order};
  }
}
