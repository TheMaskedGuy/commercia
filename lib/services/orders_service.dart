import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:product_kart/models/order_model.dart';

class OrderDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  List<Order> orders = [];

  Future<void> getOrderCollectionFB() async {
    CollectionReference orders = _firebaseFirestore.collection('orders');

    DocumentSnapshot snapshot = await orders.doc('orders').get();

    var data = snapshot.data() as Map<String, dynamic>;
    var ordersData = data['orders'] as List<dynamic>;

    ordersData.forEach((element) {
      Order orderDat = Order.fromJson(element);
      orders.add(orderDat);
    });
  }
}
