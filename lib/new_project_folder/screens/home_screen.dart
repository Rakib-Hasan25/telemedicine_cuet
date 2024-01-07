
import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/constants/global_variables.dart';
import 'package:flutter_amazon_clone/new_project_folder/provider/category_search_provider.dart';
import 'package:flutter_amazon_clone/new_project_folder/widgets/doctor_category.dart';
import 'package:flutter_amazon_clone/search/screens/search_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  void navigateToSearchScreen(String query) {
    if (query.isNotEmpty)
      Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      
      PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: 
            Row(
              children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onChanged: (value) =>  Provider.of<CategorySearchProvider>(context, listen: false).searchItems(value),
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(
                                color: Colors.black38, width: 1),
                          ),
                          hintText: 'Search Doctor Category',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          )
                          ),
                    ),
                  ),
                ),
              ),
             
            ],

            ),
          )
          ),
          
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 5,
          ),
          AllDoctorCategory(),
          SizedBox(
            height: 5,
          ),
          //
        ]),
      ),
    );
  }
}