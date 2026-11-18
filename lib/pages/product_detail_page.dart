import'package:flutter/material.dart';
import 'package:provider/provider.dart';
import'package:shopping_app/models/product.dart';
import 'package:shopping_app/models/shop.dart';

class ProductDetailPage extends StatelessWidget{
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),),
      body: SingleChildScrollView(
        
            padding: const EdgeInsets.all(16.0),
            child: Column(
          
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  product.imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),
                Text(
                  product.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                SizedBox(height: 16),
                Text(
                  product.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    final shop = context.read<Shop>();
                    shop.addTocart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added to cart')),
                    );
                  },
                  child: Text('Add to Cart',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white,),
                ),)
              ],
            ),
          ),
    
    
    );}}