import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'package:shop_barros/models/product.dart';

class ProductManager extends ChangeNotifier {
  ProductManager() {
    _loadAllProducts();
  }

  final Firestore firestore = Firestore.instance;
  List<Product> allProducts = [];

  String _search = '';
  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<Product> get filteredProducts {
    final List<Product> filteredProdutcts = [];

    if (search.isEmpty) {
      filteredProdutcts.addAll(allProducts);
    } else {
      filteredProdutcts.addAll(allProducts
          .where((p) => p.name.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredProdutcts;
  }

  Future<void> _loadAllProducts() async {
    final QuerySnapshot snapProducts =
        await firestore.collection('products').getDocuments();

    allProducts =
        snapProducts.documents.map((d) => Product.fromDocument(d)).toList();
    notifyListeners();
  }
}
