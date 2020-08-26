import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_barros/models/product_manager.dart';
import 'package:shop_barros/screens/products/components/products_list_tile.dart';
import 'package:shop_barros/screens/products/components/search_dialog.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
        // ignore: prefer_const_literals_to_create_immutables
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final search = await showDialog<String>(
                  context: context, builder: (_) => SearchDialog());
              if (search != null) {
                context.read<ProductManager>().search = search;
              }
            },
          ),
        ],
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          final filterProducts = productManager.filteredProducts;
          return ListView.builder(
              itemCount: filterProducts.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: ProductListTile(filterProducts[index]),
                );
              });
        },
      ),
    );
  }
}
