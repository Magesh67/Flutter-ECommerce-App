import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/intropage.dart';
import 'package:shopping_app/models/shop.dart';
import 'package:shopping_app/pages/cartpage.dart';
import 'package:shopping_app/pages/shop_page.dart';
import 'package:shopping_app/themes/theme_page.dart';

void main() {
  
  runApp( 
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  IntroPage(),
      theme: lightmode,
      routes:{
        '/shoppage':(context)=> ShopPage(),
        '/intropage':(context)=>IntroPage(),
        '/Cartpage':(context)=>Cartpage()}
    );
  }
}