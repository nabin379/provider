import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Providers/cart_provider.dart';
import 'package:provider_app/Providers/orders.dart';
import 'package:provider_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const id = '/cart_screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(padding:  const EdgeInsets.all(9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("total"),

                Spacer(),
                Chip(label: Text("${cart.totalToPay.toString()}\$")),
                TextButton(onPressed: (){Provider.of<Orders>(context, listen: false).addOrder(cartItems: cart.items.values.toList(), totalPrice: cart.totalToPay);
                cart.clearCart();
                }, child: Text("Order Now"))
              ],)
            
            ),
          )
 ,  SizedBox(
    height: 20,
   ),
   Expanded(child: ListView.builder(
    itemCount: cart.items.length,
    itemBuilder: (context, index) => CartItemTile(
    id:cart.items.values.toList()[index].id,
     title: cart.items.values.toList()[index].title, 
      price: cart.items.values.toList()[index].price, 
      qty: cart.items.values.toList()[index].qty,
      productId: cart.items.keys.toList()[index],
      ),))
   
        ],
      )
    );
  }
}