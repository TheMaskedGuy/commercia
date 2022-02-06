import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:product_kart/services/orders_service.dart';
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.yellowAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order ID: ${order.id}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21.0),
                  ),
                  IconButton(
                      onPressed: () {
                        OrderDB().deleteOrder(order);
                        Get.snackbar('Order Deleted!',
                            'Order with ID of ${order.id} has been deleted successfully...',
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 1));
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.delete)),
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
            Column(
              children: prodCards,
            )
          ],
        ),
      ),
    );
  }
}
