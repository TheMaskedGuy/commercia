import 'package:flutter/material.dart';
import 'package:product_kart/controllers/cart_controller.dart';
import 'package:product_kart/models/product_model.dart';
import 'package:get/get.dart';

class ProductCardCart extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const ProductCardCart(
      {required this.controller,
      required this.product,
      required this.quantity,
      required this.index,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 12,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${product.prodName.toUpperCase()}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${product.prodDecr}',
                  textAlign: TextAlign.start,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        //add to cart
                        cartController.addToCart(product);
                      },
                      splashRadius: 15.0,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        //remove from cart
                        cartController.removeFromCart(product);
                      },
                      splashRadius: 15.0,
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
