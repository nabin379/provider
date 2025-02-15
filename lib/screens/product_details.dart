import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  static const id = '/product_details';
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details page'),
      ),
    );
  }
}