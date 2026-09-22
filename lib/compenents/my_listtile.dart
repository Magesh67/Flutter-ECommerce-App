import 'package:flutter/material.dart';

class MyListtile extends StatelessWidget{

  final String title;
  final IconData icon;
 final  void Function()? onTap;
  MyListtile({super.key,required this.title,required this.icon, this.onTap});


  @override
  Widget build(BuildContext context,  ) {
    return ListTile(
      leading: Icon(icon,color:Colors.grey),
      title: Text(title,),
      onTap: onTap,
    );
  
    
  }
}