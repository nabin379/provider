import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Providers/product_providers.dart';
import 'package:provider_app/Providers/product.dart';
import 'package:provider_app/screens/cart_screen.dart';
import 'package:provider_app/screens/order_screen.dart';
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
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.pink,
            onPressed: (){
              Navigator.of(context).pushNamed(OrderScreen.id);
            }, label: Text("My Orders")),
      appBar: AppBar(
        title: Text("Nabin Store"),
        actions: [
          PopupMenuButton(
              onSelected: (int selectedVal) {
                setState(() {
                  if (selectedVal == 0) {showFav = true; }
                  if (selectedVal == 1) {showFav = false;}
                });
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
              }),
              IconButton(onPressed: (){
                Navigator.of(context).pushNamed(CartScreen.id);
              }, icon: Icon(Icons.shopping_cart_checkout))
        ],
      ),
      body: ProductsGrid(isFav: showFav),
    ));
  }
}

class ProductsGrid extends StatelessWidget {
 const ProductsGrid({
    Key? key,
    required this.isFav,
  }) : super(key: key);

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
