import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/constants/global_variables.dart';


class AdminAppBar extends StatelessWidget {
  const AdminAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration:
            const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/amazon_in.png',
              width: 120,
              height: 45,
              color: Colors.black,
            ),
          ),

         Text("Admin",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          
         ),)
        ],
      ),
    );
  }
}