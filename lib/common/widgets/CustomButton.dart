import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text,this.color});
  final String text;
  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text,style: TextStyle(color: color==null? Colors.white:Colors.black),),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        primary: color
      ),
    );
  }
}
