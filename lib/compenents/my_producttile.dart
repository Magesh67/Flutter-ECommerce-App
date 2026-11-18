import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/models/shop.dart';
import'package:shopping_app/pages/product_detail_page.dart';

class MyProducttile extends StatelessWidget {
  final Product product;
  MyProducttile({super.key, required this.product});


  void addTocart(BuildContext context){
      showDialog(context: context, builder:(context)=>AlertDialog(content: Text("Add this item to your cart?"),
      actions: [
        MaterialButton(onPressed: (){
          Navigator.pop(context);
        
        },
        child: Text("Cancel")),
        MaterialButton(onPressed: (){Navigator.pop(context);
        context.read<Shop>().addTocart(product);},
      
        child: Text("Yes"),
        )
      ],
      ),);
  }

  @override
  Widget build(BuildContext context) {
    // DO: implement build
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailPage(product: product)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
      
              children: [
                AspectRatio(
                  aspectRatio: 1.05,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    child: Image.network(product.imageUrl,fit:BoxFit.contain,
                    loadingBuilder:(context,child,loadingProgress){
                      if(loadingProgress==null) return child;
                      return const Center(child: CircularProgressIndicator());},
                      errorBuilder:(context,error,stackTrace){
                        return const Center(child: Icon(Icons.error));
                    
                    } ,),
                  ),
                ),
      
                SizedBox(height: 20),
      
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    product.title,
                    maxLines: 1,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
      
                SizedBox(height: 10),
      
                //product descryption
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$' + product.price.toStringAsFixed(2)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: IconButton(onPressed: () {
                      addTocart(context);
                    }, icon: Icon(Icons.add)),
                  ),
                ],
              ),
            ),
          ],
        ),
      
        //product price
      ),
    );
  }
}
