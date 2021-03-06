import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_kart/controllers/cart_controller.dart';
import 'package:product_kart/models/product_model.dart';
import 'package:product_kart/services/orders_service.dart';
import 'package:product_kart/widgets/product_card_cartpage.dart';

import '../models/order_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'CART',
                style: TextStyle(color: Colors.white),
              ),
              MaterialButton(
                elevation: 0.0,
                color: Colors.white,
                onPressed: () {
                  //saving order
                  OrderDB().createOrder(cartController.cartProducts2);
                  cartController.removeAll();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Save Order',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: cartController.cartProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductCardCart(
                  controller: cartController,
                  product: cartController.cartProducts.keys.toList()[index],
                  quantity: cartController.cartProducts.values.toList()[index],
                  index: index);
            },
          ),
        ),
      ),
    );
  }
}
