import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:product_kart/models/order_model.dart';

import '../models/product_model.dart';

class OrderDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void createOrder(order) {
    List<Map> productJsonArray = [];
    for (Product product in order) {
      productJsonArray.add(Product.toJson(product));
    }

    var toAddtoDB = [Order.toJson(productJsonArray)];

    CollectionReference orders = _firebaseFirestore.collection('orders');
    // List dbData = await getOrders2();
    orders.doc('orders').update({'orders': FieldValue.arrayUnion(toAddtoDB)});
    print('---------------$toAddtoDB------------');
  }

  void deleteOrder(Order order) {
    var ord = [
      {
        'id': order.id,
        'products': order.products.map((e) => Product.toJson(e)).toList()
      }
    ];

    CollectionReference orders = _firebaseFirestore.collection('orders');
    orders.doc('orders').update({'orders': FieldValue.arrayRemove(ord)});
    print('---------------$ord------------');
  }

  Future<List<Order>> getOrders() async {
    List<Order> orderList = [];
    CollectionReference orders = _firebaseFirestore.collection('orders');

    DocumentSnapshot snapshot = await orders.doc('orders').get();

    var data = snapshot.data() as Map<String, dynamic>;
    var ordersData = data['orders'] as List<dynamic>;

    ordersData.forEach((orderDat) {
      //
      Order ord = Order.fromJson(orderDat);
      orderList.add(ord);
    });
    return orderList;
  }

  Future<List<dynamic>> getOrders2() async {
    CollectionReference orders = _firebaseFirestore.collection('orders');

    DocumentSnapshot snapshot = await orders.doc('orders').get();

    var data = snapshot.data() as Map<String, dynamic>;
    var ordersData = data['orders'] as List<dynamic>;
    return ordersData;
  }
}
