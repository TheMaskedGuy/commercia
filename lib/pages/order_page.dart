import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_kart/models/order_model.dart';
import 'package:product_kart/widgets/order_widget.dart';
import '../services/orders_service.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('ORDERS'),
      ),
      body: FutureBuilder<List<Order>>(
        future: OrderDB().getOrders(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return OrderCard(order: snapshot.data![index]);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }
}
