import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/constants/global_variables.dart';
import 'package:flutter_amazon_clone/features/home/screens/category_screen.dart';


class TopCatagories extends StatelessWidget {
  const TopCatagories({super.key});
  
  void navigateToCategoryPage(BuildContext context,String category){
    Navigator.pushNamed(context, CategoryDealsScreens.routeName,arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
          itemCount: GlobalVariables.categoryImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap:()=>navigateToCategoryPage(context,GlobalVariables.categoryImages[index]['title']!) ,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                    child: Image.asset(GlobalVariables.categoryImages[index]['image']!
                    ,fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                    ),
                    ),
                  ),
                  Text(GlobalVariables.categoryImages[index]['title']!,
                  style: TextStyle(fontSize: 12,
                  fontWeight: FontWeight.w400),
                  )
            
            
                
            
                ],
              ),
            );
          }),
    );
  }
}
