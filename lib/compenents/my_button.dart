import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({super.key, required this.onTap, required this.child});

  void Function()? onTap;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child:Container(
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.all(15),
         child:child,

      ),
     
    );
  }
}