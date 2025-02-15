import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Providers/product_providers.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      
      home: MyHomePage() ,
      routes: {
        ShoppingScreen.id :(c) => ShoppingScreen(),
        ProductDetails.id : (c) => ProductDetails(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (BuildContext context) => Products(),
     
    child: ShoppingScreen()) ;
  }
}