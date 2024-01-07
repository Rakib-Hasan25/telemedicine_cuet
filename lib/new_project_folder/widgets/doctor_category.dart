import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/new_project_folder/provider/category_search_provider.dart';
import 'package:flutter_amazon_clone/new_project_folder/screens/category_doctor_screen.dart';
import 'package:flutter_amazon_clone/new_project_folder/utils/constants.dart';
import 'package:provider/provider.dart';


class AllDoctorCategory extends StatelessWidget {
  const AllDoctorCategory({super.key});
  
  void navigateToCategoryPage(BuildContext context,String category){
    Navigator.pushNamed(context, DoctorCategoryScreen.routeName,arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*1,
      width: MediaQuery.of(context).size.width*1,
      child: 

      Consumer<CategorySearchProvider>(
         
         builder: (context,provider,child) {
           return GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Three items per row
              childAspectRatio: 1, // Adjust the aspect ratio as needed
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap:()=>navigateToCategoryPage(context,Constant.doctorCategories[index]['title']!) ,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          provider.foundItems[index]['imageIcon']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(provider.foundItems[index]['title']!),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount:provider.foundItems.length ,
                 );
         }
       ),
      
  
    );
  }
}
