import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Providers/product_providers.dart';
import 'package:provider_app/models/product.dart';
import 'package:provider_app/widgets/product_item.dart';

class ShoppingScreen extends StatelessWidget {
  static const id = '/shopping_screen';
  ShoppingScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: productsGrid(),
    ));
  }
}

class productsGrid extends StatelessWidget {
  const productsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  final productsData =  Provider.of<Products>(context);
  final availableProducts = productsData.availableProducts;
    return GridView .builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: availableProducts.length,
      itemBuilder: (context, index) {
        return ProductItem(
            id: availableProducts[index].id,
            title: availableProducts[index].title,
            image: availableProducts[index].image);
      },
    );
  }
}
