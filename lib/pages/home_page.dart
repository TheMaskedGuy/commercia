import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_kart/controllers/cart_controller.dart';
import 'package:product_kart/models/product_model.dart';
import 'package:product_kart/pages/cart_page.dart';
import 'package:product_kart/pages/order_page.dart';
import 'package:product_kart/services/firestore_db.dart';
import 'package:product_kart/services/orders_service.dart';
import 'package:product_kart/widgets/product_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final orderDB = Get.put(OrderDB());
    //
    print('#######${FireStoreDB().getData()}');
    //

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                hintText: 'Enter product name...',
                hintStyle: const TextStyle(color: Colors.white)),
            cursorColor: Colors.white,
            onSubmitted: (value) async {
              setState(() {
                searchQuery = value;
              });
              print(searchQuery);
            },
            style: const TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => const CartPage());
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.sticky_note_2_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Get.to(() => const OrderPage());
              },
            ),
          ],
        ),
        body: searchQuery.isEmpty
            ? StreamBuilder<List<Product>>(
                stream: FireStoreDB().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    final products = snapshot.data!;
                    return ListView(
                      children: products.map(productCard).toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            : FutureBuilder(
                future: FireStoreDB().getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return ListView();
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
      ),
    );
  }
}
// ListView(
// children: productList,
// ),
