import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/compenents/my_button.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/models/shop.dart';

class Cartpage extends StatelessWidget {
  Cartpage({super.key});

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "User wants to pay ! connect this app to your payment backend",
        ),
      ),
    );
  }

  void removeItemfromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this item to your cart?"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },

            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.watch<Shop>();
    final product = shop.uniqueCartProducts;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 10,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "CART PAGE",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: product.isEmpty

                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart,size: 50,),
                  Text("Your Cart is Empty..")]),
                )
                : ListView.builder(
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      final item = product[index];
                      final quantity = shop.getQuantity(item);
                      return Card(
                      
                        margin: EdgeInsets.all(15),
                          
                          child: ListTile(
                          
                            leading: SizedBox(
                              
                              child: Image.network(
                                item.imageUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                            
                              title: SizedBox(
                                child: Text(
                                  item.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            
                          
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 25,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      201,
                                      199,
                                      199,
                                    ),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        
                          
                                          Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Colors.amber,
                                          ),
                                       
                                      
                                         Text(
                                            "${item.rating}",
                                            style: TextStyle(fontSize: 15,color:Colors.grey[800])),
                                          
                                       
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                 Text(
                                  "\$${item.price.toStringAsFixed(2)}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                               
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    
                                    IconButton(
                                      onPressed: () {
                                        context.read<Shop>().removeFromCart(item);
                                      },
                                      icon: Icon(Icons.remove_circle),
                                    ),
                          
                                    Text(
                                      "$quantity",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context.read<Shop>().addTocart(item);
                                      },
                                      icon: Icon(Icons.add_circle),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                removeItemfromCart(context, item);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ),
                      
                      );
                    },
                  ),
          ),
          Container(
            padding:EdgeInsets.all(20),
            child:Column(
              children: [
                Container(
                 
                 height: 40,
                 width: double.infinity,
                 decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                 ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    
                      const Text("Total Price",style:TextStyle(fontSize:18,fontWeight:FontWeight.bold,color:Colors.white)),
                      Text("\$${shop.totalPrice.toStringAsFixed(2)}",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:Colors.white))
                    ],),
                  ),
                )
              ],
            )
          ),
          const SizedBox(height: 20),
          SizedBox(
            child: ElevatedButton(
              onPressed: product.isEmpty
                  ? null
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("CheckOut Not Implemented Yet")),
                      );
                    },
              child: const Text("Checkout"),
              style:ElevatedButton.styleFrom(backgroundColor:Colors.black,foregroundColor:Colors.white,
              padding:EdgeInsets.all(10),
              shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(10))
              ))
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text(
                "Pay Now",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
