import 'package:shopping_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  //product list
  final List<Product> _shop=[
    Product(name: "Product 1", price: 99.00, descryption: "item descryption", imgaePath: "lib/images/image1.png", ),
    Product(name: "Product 2", price: 99.00, descryption: "item descryption", imgaePath: "lib/images/image2.png", ),
    Product(name: "Product 3", price: 99.00, descryption: "item descryption", imgaePath: "lib/images/image3.png", ),
    Product(name: "Product 4", price: 99.00, descryption: "item descryption", imgaePath: "lib/images/image4.png", ),
  
  
  ];
  //user cart
  List<Product> _cart=[];
 
 
  //get product list
  List<Product> get shop=>_shop;

  

  //get user cart
   List<Product> get cart=>_cart;

  //add item to cart
  void addTocart(Product item){
      _cart.add(item);
      notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }
}