import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Providers/product_providers.dart';
import 'package:provider_app/Providers/product.dart';
import 'package:provider_app/widgets/product_item.dart';

class ShoppingScreen extends StatefulWidget {
  static const id = '/shopping_screen';
  ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  bool showFav = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Nabin Store"),
        actions: [
          PopupMenuButton(
              onSelected: (int selectedVal) {
                if (selectedVal == 0) {
                  showFav = true;
                }
                if (selectedVal == 1) {
                  showFav = false;
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) {
                return [
                  PopupMenuItem(
                    child: Text("filter by favorite"),
                    value: 0,
                  ),
                  PopupMenuItem(child: Text("remove filters"), value: 1),
                ];
              })
        ],
      ),
      body: productsGrid(isFav: showFav),
    ));
  }
}

class productsGrid extends StatelessWidget {
  const productsGrid({
    super.key,
 required this.isFav });
final bool isFav;
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
   final availableProducts = isFav 
        ? productsData.favoriteProducts 
        : productsData.availableProducts;
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: availableProducts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider<Product>.value(
          value: availableProducts[index],
          // create: (BuildContext context) => availableProducts[index],
          child: ProductItem(
              //  id: availableProducts[index].id,
              //  title: availableProducts[index].title,
              //   image: availableProducts[index].image
              ),
        );
      },
    );
  }
}
