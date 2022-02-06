import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:product_kart/models/product_model.dart';
import 'package:product_kart/widgets/product_card_widget.dart';

class FireStoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //fetch
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList();
    });
  }

  //search
  // Future<List<Product>> queryData(String query) async {
  //   List queryResult = [];
  //   await _firebaseFirestore
  //       .collection('products')
  //       .where('name', isEqualTo: 'Ap')
  //       .get()
  //       .then((QuerySnapshot snap) {
  //     for (var doc in snap.docs) {
  //       queryResult.add(doc.data());
  //     }
  //   });
  //   return queryResult.map((e) => Product.fromJson(e)).toList();
  // }

  //search v2
  Future getData() async {
    QuerySnapshot querySnapshot =
        await _firebaseFirestore.collection('products').get();
    // final allData = querySnapshot.docs.map((doc) => doc.data());
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> va = doc.data() as Map<String, dynamic>;
      Product.fromJson(va);
    }).toList();

    // print('########################,$allData');
  }
}
