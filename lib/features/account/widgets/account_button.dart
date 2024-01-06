import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return
         Expanded(
           child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black12.withOpacity(0.03),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
              ),
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
              ),
              onPressed:onTap,
            ),
                 ),
         );
     
  }
}
