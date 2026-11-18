import 'package:flutter/foundation.dart';
import 'package:shopping_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/services/product_service.dart';

class Shop extends ChangeNotifier{

  final ProductService _productService = ProductService();
  //product list
  List<Product> _shop=[];

  //user cart
  List<Product> _cart=[];

  bool isLoading=false;
 
 String? errorMessage;

 String _searchQuery="";
 String _selectedCategory="All";
 
  //get product list
  List<Product> get shop=>_shop;

  

  //get user cart
   List<Product> get cart=>_cart;

   String get searchQuery=>_searchQuery;

  String get selectedCategory=>_selectedCategory;

   Future<void> loadProducts() async{
    isLoading=true;
    errorMessage=null;
    notifyListeners();
    try{
      
      _shop=await _productService.fecthProducts();

  }catch(e,stackTrace){
    errorMessage=e.toString();

    debugPrint("API ERROR :$e");
    debugPrint("stackTrace: $stackTrace");
   } finally{
    isLoading=false;
    notifyListeners();}}
    int getQuantity(Product product){
      return _cart.where((item) => item.id==product.id).length;
    }

    void increseQuantity(Product product){
      _cart.add(product);
      notifyListeners();
    }
    void decreaseQuantity(Product product){
      final index=_cart.where((item) => item.id==product.id);
    
       if(index!=-1){
      _cart.removeAt(index as int);
      notifyListeners();
    }}
    
   

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

  void searchProducts(String query){
    _searchQuery=query;
    notifyListeners();
  }

  void filteByCategory(String Category){
    _selectedCategory=Category;
    notifyListeners();
  }

  List<String> get Categories{
    final categoryNames=_shop
    .map((product)=>product.category).toSet().toList();

    categoryNames.sort();
    return["All",...categoryNames];
  }

  List<Product>get filteredProducts{
    return _shop.where((product){
      final matchesSearch=product.title.toLowerCase().contains(_searchQuery.trim().toLowerCase());

      final matchesCategory=_selectedCategory=="All"||product.category.toLowerCase()==_selectedCategory.toLowerCase();
      return matchesSearch && matchesCategory;
    }).toList();
  }

double get totalPrice{
  return _cart.fold(0.0,(total,product)=>total+product.price);

}
List<Product>  get uniqueCartProducts{
  final seenlds=<int>{};
  return _cart.where((product){
    return seenlds.add(product.id);}).toList();
  
}
}

