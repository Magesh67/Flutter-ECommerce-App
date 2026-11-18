import'dart:convert';
import 'package:flutter/material.dart';
import'package:http/http.dart'as http;
import 'package:shopping_app/models/product.dart';

class ProductService{
  Future<List<Product>> fecthProducts() async{
    final url=Uri.parse('https://dummyjson.com/products');
try{
    final response=await http.get(url);
    debugPrint("API status code: ${response.statusCode}");
    debugPrint("API response body: ${response.body}");
    if(response.statusCode==200) {
      final data=jsonDecode(response.body);
      final List productsJson=data['products'];
      return productsJson.map((product){return Product.fromJson(product);}).toList();
      
    } 
    else{
      throw Exception('Failed to load products');
    }}catch(e){
      debugPrint("Error in fecthProducts: $e");
      rethrow;
    }
    }
}