import 'package:flutter/material.dart';
import 'package:shopping_app/compenents/my_button.dart';

class IntroPage extends StatelessWidget {
  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_cart,
              size:50,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            Text("Minimal Shop",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            //title
            SizedBox(height: 10,),
            //subtitle
            Text("Welcome to the Minimal Shop!",style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary,),textAlign: TextAlign.center,
           ),
           SizedBox(height: 20,),
            //button
            MyButton(onTap: ()=>Navigator.pushNamed(context, '/shoppage'), child:Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
