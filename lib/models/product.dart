
class Product {
 final String id;
  final String title;
  final String description;
  final String image;
  final String price;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
     this.isFavorite = false,

  });
 }

 var p = Product(id: '12', title: 'mobile', description: 'nokia', image: 'https://source.unsplash.com/400x400/?mobile,phone', price: '34999');