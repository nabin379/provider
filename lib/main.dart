import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Providers/cart_provider.dart';
import 'package:provider_app/Providers/orders.dart';
import 'package:provider_app/Providers/product_providers.dart';
import 'package:provider_app/screens/cart_screen.dart';
import 'package:provider_app/screens/order_screen.dart';
import 'package:provider_app/screens/product_details.dart';
import 'package:provider_app/screens/shopping_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => Products()),
          ChangeNotifierProvider(create: (BuildContext context) => Cart()),
          ChangeNotifierProvider(create: (BuildContext context) => Orders()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: ShoppingScreen.id,
          routes: {
            ShoppingScreen.id: (c) => ShoppingScreen(),
            ProductDetails.id: (c) => ProductDetails(),
            CartScreen.id: (c) => CartScreen(),
            OrderScreen.id: (c) => OrderScreen(),
          },
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShoppingScreen();
  }
}
