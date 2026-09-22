import 'package:flutter/material.dart';
import 'package:shopping_app/compenents/my_listtile.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      //DrawerHead
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 50,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: MyListtile(
                  icon: Icons.home,
                  title: "Home",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: MyListtile(
                  icon: Icons.shopping_cart,
                  title: "Cart",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/Cartpage');
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 10),
            child: MyListtile(icon: Icons.logout, title: "Exit", onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, '/intropage',(route)=>false);
            }),
          ),
        ],
      ),
    );
  }
}
