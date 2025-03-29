import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Providers/product_providers.dart';

class ProductDetails extends StatelessWidget {
  static const id = '/product_details';
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
        var id = ModalRoute.of(context)?.settings.arguments as String;
    final ourProduct  = Provider.of<Products>(context, listen:false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details page'),
      ),
      body: Column(children: [
        Container(
           height:20,
           width: double.infinity,
           child: Image.asset(ourProduct.image,
           fit: BoxFit.cover,),
        
        
        
        ),

        SizedBox(height: 20,),
Text("\$${ourProduct.price}",style:TextStyle(color: Colors.grey,fontSize: 20)),
SizedBox(height: 20,),
Text("${ourProduct.description}"),
      ],),
    );
  }
}