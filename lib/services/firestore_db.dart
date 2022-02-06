import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:product_kart/models/product_model.dart';
import 'package:product_kart/widgets/product_card_widget.dart';

class FireStoreDB extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //fetch stream
  // Stream<List<Product>> getAllProducts() {
  //   return _firebaseFirestore
  //       .collection('products')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       return Product.fromJson(doc.data());
  //     }).toList();
  //   });
  // }

  //fetch - actual

  Future<List<Product>> getMyProducts() async {
    List<Product> _products = [];
    CollectionReference collectionReference =
        _firebaseFirestore.collection('myprod');

    DocumentSnapshot snapshot = await collectionReference.doc('products').get();

    var data = snapshot.data() as Map;
    var productsData = data['products'] as List<dynamic>;

    productsData.forEach((prodData) {
      Product product = Product.fromJson(prodData);
      _products.add(product);
    });
    return _products;
  }
}
