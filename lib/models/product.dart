class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  final double rating;
  final String category;

  Product({  required this.id, required this.title, required this.price, required this.description, required this.imageUrl, required this.rating, required this.category});

//covert json into product object
  
factory Product.fromJson(Map<String,dynamic>json){
  return Product(
    id: json['id'] as int,
    title: json['title'] as String,
    price: (json['price'] as num).toDouble(),
    description: json['description'] as String,
    imageUrl: json['thumbnail'] as String,
    rating: (json['rating'] as num).toDouble(), category: json['category']as String,
  );
}



  
}