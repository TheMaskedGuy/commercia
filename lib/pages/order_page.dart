import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_kart/widgets/order_widget.dart';
import '../services/orders_service.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  void initOrderList() async {
    await OrderDB().getOrderCollectionFB();
  }

  @override
  void initState() {
    initOrderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> orderWidget = [];
    final orderDB = Get.find<OrderDB>();

    for (var order in orderDB.orders) {
      orderWidget.add(OrderCard(order: order));
      print('adding: ${order}');
    }

    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: orderWidget,
      )),
    );
  }
}
