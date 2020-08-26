import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_barros/common/custom_drawer/custom_drawer.dart';
import 'package:shop_barros/models/page_manager.dart';
import 'package:shop_barros/screens/products/products_screen.dart';

// ignore: use_key_in_widget_constructors
class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home1'),
            ),
          ),
          const ProductsScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Testando Home'),
            ),
          ),
        ],
      ),
    );
  }
}
