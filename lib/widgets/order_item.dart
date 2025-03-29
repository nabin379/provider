import 'package:flutter/material.dart';
import 'package:provider_app/Providers/orders.dart';

class OrderItemTile extends StatefulWidget {
  const OrderItemTile({super.key, required this.order});

  final OrderItem order;

  @override
  State<OrderItemTile> createState() => _OrderItemTileState();
}

class _OrderItemTileState extends State<OrderItemTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context, ) {
    return Card(
margin: EdgeInsets.all(10),
child: Column(
  children: [
    ListTile(
      title: Text('${widget.order.totalPrice}\$'),
      subtitle: Text('${widget.order.orderTime}'),
      trailing: IconButton(onPressed: (){
        setState(() {
          isExpanded= !isExpanded;
        });
      }, icon:isExpanded? Icon(Icons.expand_less):Icon(Icons.expand_more)  ),
    )
 , if(isExpanded) Container(
  child: ListView(
    children: widget.order.cartItems.map((product)=>Row(
       children: [
        Expanded(child: Text("${product.title}")),
                Text("x${product.qty}"),
                SizedBox(width: 10,),
                        Text("${product.price}")


       ],
    )).toList(),
  ),
 )
  ],
),
    );
  }
}