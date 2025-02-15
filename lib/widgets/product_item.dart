import 'package:flutter/material.dart';
import 'package:provider_app/screens/product_details.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.id, required this.title, required this.image});
final String id, title ,image;
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetails.id, arguments: id);
          },
          child: Image.asset(image)),
      footer: GridTileBar(
        title: Text(title,textAlign:TextAlign.center,),
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
      ),
      ),
    );
  }
}