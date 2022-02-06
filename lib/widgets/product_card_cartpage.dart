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
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${product.prodName.toUpperCase()}',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${product.prodDecr}',
                textAlign: TextAlign.center,
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
                      Icons.linear_scale_outlined,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.black,
                indent: 5.0,
                endIndent: 5.0,
                thickness: 1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
