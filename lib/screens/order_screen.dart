import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Providers/orders.dart';
import 'package:provider_app/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const id = '/OrdersScreen';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(itemCount: orders.myOrders.length,
      itemBuilder: (context, index) => OrderItemTile(order:orders.myOrders[index]),),
    );
  }
}