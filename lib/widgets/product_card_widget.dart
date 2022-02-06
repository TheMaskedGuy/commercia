import 'package:flutter/material.dart';
import 'package:product_kart/controllers/cart_controller.dart';
import 'package:product_kart/models/product_model.dart';
import 'package:get/get.dart';

Widget productCard(Product product) {
  final cartController = Get.find<CartController>();

  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: ListTile(
      // leading: Text(product.prodID.toString()),
      title: Text(product.prodName),
      subtitle: Text(product.prodDecr),
      trailing: IconButton(
        onPressed: () {
          // add to cart
          cartController.addToCart(product);

          Get.snackbar(
              'Added to Cart!', 'You have added ${product.prodName} to cart.',
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 1));
        },
        splashRadius: 20.0,
        icon: const Icon(
          Icons.add_shopping_cart_outlined,
          color: Colors.green,
        ),
      ),
    ),
  );
}
