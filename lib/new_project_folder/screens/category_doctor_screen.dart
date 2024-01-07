import 'package:flutter/material.dart';

import 'package:flutter_amazon_clone/constants/global_variables.dart';
import 'package:flutter_amazon_clone/new_project_folder/provider/category_search_provider.dart';
import 'package:flutter_amazon_clone/new_project_folder/provider/doctor_search_provider.dart';
import 'package:flutter_amazon_clone/new_project_folder/screens/doctor_details_screen.dart';
import 'package:flutter_amazon_clone/new_project_folder/utils/constants.dart';
import 'package:provider/provider.dart';

class DoctorCategoryScreen extends StatefulWidget {
  static const String routeName = "/category_doctor_screen";
  final String category;
  const DoctorCategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<DoctorCategoryScreen> createState() => _DoctorCategoryScreenState();
}

class _DoctorCategoryScreenState extends State<DoctorCategoryScreen> {


  // HomeServices homeServices = HomeServices();
  // List<Product>? productList;

  @override

  


  // void initState() {
  //   super.initState();
  //   fetchCategoryProduct();
  // }

  // void fetchCategoryProduct() async {
  //   productList = await homeServices.fetchCategoryProducts(
  //       context: context, category: widget.category);
  //       setState(() {});
  // }




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
                      // onFieldSubmitted: navigateToSearchScreen,
                      onChanged: (value) =>  Provider.of<DoctorSearchProvider>(context, listen: false).searchItems(value),
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
                          hintText: 'Search doctors',
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
      body:
      // Constant.doctors== null?
      // const Center(
      //   child: CircularProgressIndicator() ,
      // )
      // : 
      Consumer<DoctorSearchProvider>(
        
        builder: (context, provider, child) {
          return ListView.builder(
                  itemCount: provider.foundItems.length,
                  itemBuilder: (context, index) {
           return InkWell(
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorDetailsScreen(name: provider.foundItems[index]['name']?? "", picture: provider.foundItems[index]['image']??"", degree: provider.foundItems[index]['degree']??"", speciality: provider.foundItems[index]['speciality']??"", designation: provider.foundItems[index]['designation']??"", workplace:provider.foundItems[index]['workplace']??"")) ),
             child: Card(
               child: ListTile(
                 leading: Image.network(provider.foundItems[index]['image'] ?? ''),
                 title: Text(provider.foundItems[index]['name'] ?? ''),
                 subtitle: Text('${provider.foundItems[index]['degree'] ?? ''}\n${Constant.doctors[index]['workplace'] ?? ''}'),
               ),
             ),
           );
                  }
                  );
        }
      ),

       

      // Column(
      //   children: [
      //     Container(
      //       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //       alignment: Alignment.topLeft,
      //       child: Text(
      //         "${widget.category}",
      //         style: const TextStyle(fontSize: 20),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 170,
      //       child: GridView.builder(
      //           itemCount: productList!.length,
      //           scrollDirection: Axis.horizontal,
      //           padding: const EdgeInsets.only(left: 15),
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 1,
      //               childAspectRatio: 1.4,
      //               mainAxisSpacing: 10),
      //           itemBuilder: (context, index) {
      //             final product = productList![index];
      //             return Column(
      //               children: [
      //                 SizedBox(
      //                   height: 130,
      //                   child: DecoratedBox(decoration: BoxDecoration(border: Border.all(color:Colors.black12,width: 0.5)),
                        
      //                   child: Padding(padding: EdgeInsets.all(10),
      //                   child: Image.network(product.images[0])
      //                   ),
      //                   ),
      //                 ),
      //                 Container(
      //                   alignment: Alignment.topLeft,
      //                   padding: EdgeInsets.only(left: 10),
      //                   child: Text(
      //                     product.name,
      //                     maxLines: 1,
      //                     overflow: TextOverflow.ellipsis,
      //                     style: const TextStyle(fontSize: 15),
      //                   ),
      //                 )
      //               ],
      //             );
      //           }),
      //     )
      //   ],
      // ),
    );
  }
}
