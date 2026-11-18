import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/compenents/my_producttile.dart';
import 'package:shopping_app/drawer/my_drawer.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/models/shop.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});

  //ac

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //access the product in shop
    final shop = context.watch<Shop>();
    final products = shop.filteredProducts;


debugPrint("Total products: ${shop.shop.length}");
debugPrint("Filtered products: ${products.length}");
debugPrint("Search query: ${shop.searchQuery}");
debugPrint("API error: ${shop.errorMessage}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 10,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/Cartpage"),
            icon: Icon(Icons.shopping_cart_checkout_rounded),
          ),
        ],
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "SHOP PAGE",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) =>
                    context.read<Shop>().searchProducts(value),
                decoration: InputDecoration(
                  hoverColor: Colors.black,
                  prefixIconColor: Colors.grey[700],
                  fillColor: Colors.black,
                  hintStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                  hintText: "Search by Keywords",
                  prefixIcon: Icon(Icons.search),
                  isDense: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            //shop subtitle
            Center(
              child: Text(
                "Pick from the best products",
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),

            const SizedBox(height: 20),
            if (shop.isLoading)
              const SizedBox(
                height: 400,
                child: Center(child: CircularProgressIndicator()),
              )
            else if (shop.errorMessage != null)
              SizedBox(
                height: 400,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 30,
                        color: Colors.black,
                      ),
                      Center(child: const Text("Failed to load products")),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<Shop>().loadProducts();
                        },
                        child: const Text(
                          "Retry",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else if (shop.shop.isEmpty)
              const SizedBox(
                height: 400,
                child: Center(child: Text("No Products Available")),
              )
            else if(products.isEmpty)const SizedBox(
              height: 400,
              child: Center(child: Text("No Products Found",style: TextStyle(fontWeight: FontWeight.bold),),),
            )
            else
              //product list
              SizedBox(
                height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return MyProducttile(product: product);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
