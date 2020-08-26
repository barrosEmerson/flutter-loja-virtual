import 'package:flutter/material.dart';
import 'package:shop_barros/models/product.dart';

class ProductListTile extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ProductListTile(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(product.images.first),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'A partir de',
                    style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                  ),
                ),
                const Text(
                  'R\$ 18,99',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue,
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
