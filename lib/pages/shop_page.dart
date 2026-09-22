import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/compenents/my_producttile.dart';
import 'package:shopping_app/drawer/my_drawer.dart';
import 'package:shopping_app/models/shop.dart';

class ShopPage extends StatelessWidget{

  ShopPage({super.key});

  //ac

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //access the product in shop
    final products=context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 10,
      actions: [
        IconButton(onPressed: ()=>Navigator.pushNamed(context,"/Cartpage"), icon: Icon(Icons.shopping_cart_checkout_rounded))
      ],
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title:  Text("SHOP PAGE",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      centerTitle: true,),
      drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body:ListView(
          children:[ 
            SizedBox(height: 20),
            //shop subtitle
            Center(child: Text("Pick from the best products",style: TextStyle(fontSize: 15,color: Theme.of(context).colorScheme.inversePrimary),)),
            
            
            //product list
            SizedBox(
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
             padding: EdgeInsets.all(10),
              itemCount: products.length,
              itemBuilder: (context,index){
                final product=products[index];
                return MyProducttile(product: product);
              }
            ),
          ),]
        )
    );
  }
}