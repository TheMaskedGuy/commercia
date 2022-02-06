import 'package:flutter/material.dart';
import 'package:product_kart/widgets/product_card_widget.dart';

import '../models/order_model.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({required this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> prodCards = [];
    for (var product in order.products) {
      prodCards.add(productCard(product));
    }

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Order ID: ${order.id}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
          ),
          Text('Products in Order: '),
          Column(
            children: prodCards,
          )
        ],
      ),
    );
  }
}
