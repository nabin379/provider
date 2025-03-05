import 'package:flutter/material.dart';
import 'package:provider/provider.dart' ;
import 'package:provider_app/Providers/product.dart';
import 'package:provider_app/Providers/product_providers.dart';
import 'package:provider_app/screens/product_details.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key,
  });
  @override
  Widget build(BuildContext context) {
  final product =  Provider.of< Product>(context);
    return  Consumer<Product>(
      builder: (context, product,child) {
          return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(ProductDetails.id, arguments: product.id);
            },
            child: Image.asset(product.image)),
        footer: GridTileBar(
          title: Text(product.title,textAlign:TextAlign.center,),
          backgroundColor: Colors.black,
          leading: IconButton(onPressed: (){product.toogleIsFav();}, icon: product.isFavorite? Icon(Icons.favorite):Icon(Icons.favorite_border)),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
        ),
        ),
          );
  
      }
      );
  }
}