import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/compenents/my_button.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/models/shop.dart';

class Cartpage extends StatelessWidget{
  Cartpage({super.key});

  void payButtonPressed (BuildContext context){
    showDialog(context: context, builder: (context)=>AlertDialog(content: Text("User wants to pay ! connect this app to your payment backend"),));
  }

  void removeItemfromCart(BuildContext context,Product product){
     showDialog(context: context, builder:(context)=>AlertDialog(content: Text("Remove this item to your cart?"),
      actions: [
        MaterialButton(onPressed: (){
          Navigator.pop(context);
        
        },
        child: Text("Cancel")),
        MaterialButton(onPressed: (){Navigator.pop(context);
        context.read<Shop>().removeFromCart(product);},
      
        child: Text("Yes"),
        )
      ],
      ),);

  }

  @override
  Widget build(BuildContext context) {
    
  final cart=context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 10,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title:  Text("CART PAGE",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      centerTitle: true,),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(child: cart.isEmpty?Center(child: Text("Your Cart is Empty..")): ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context,index){
            final item=cart[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.price.toStringAsFixed(2)),
              trailing: IconButton(onPressed: (){
                removeItemfromCart(context,item);
              }, icon: Icon(Icons.remove))

            );
          })),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: MyButton(
              
              onTap: ()=>payButtonPressed(context), child: Text("Pay Now",style: TextStyle(fontWeight: FontWeight.bold),)),
          )
        ],
      ),
    );
    
  }
}