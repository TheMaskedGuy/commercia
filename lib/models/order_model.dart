import 'package:product_kart/models/product_model.dart';

class Order {
  final int id;
  final List<Product> products;

  Order({required this.id, required this.products});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json['id'], products: Product.fromJsonArray(json['products']));
  }
}
