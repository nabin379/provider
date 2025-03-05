import 'package:flutter/material.dart';
import 'package:provider_app/Providers/product.dart';

class Products with ChangeNotifier{
  List<Product> _availableProducts = [
    Product(
        id: '101',
        title: 'iphone ',
        description: 'best phone',
        image: 'assets/images/iphone.jpg',
        price: '79999'),
         Product(
        id: '102',
        title: 'vivo ',
        description: 'ramro phone',
        image: 'assets/images/vivo.jpg',
        price: '39999'),
         Product(
        id: '103',
        title: 'oppo ',
        description: 'thikai phone',
        image: 'assets/images/oppo.jpg',
        price: '9999'),
         Product(
        id: '104',
        title: 'nokia ',
        description: 'bestest phone',
        image: 'assets/images/nokia.jpg',
        price: '979999'),
         
  ];
  List <Product> get favoriteProducts{
    return _availableProducts.where((product)=>product.isFavorite).toList(); 
  }
  List <Product> get availableProducts =>  _availableProducts;

  
  // void addProduct(value){
  //   _availableProducts.add(value);
  //   notifyListeners();
  // }
  
}