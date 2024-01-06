import 'package:flutter/material.dart';

import 'package:flutter_amazon_clone/constants/global_variables.dart';
import 'package:flutter_amazon_clone/features/home/screens/services/home_services.dart';
import 'package:flutter_amazon_clone/models/product.dart';

class CategoryDealsScreens extends StatefulWidget {
  static const String routeName = "/category-deals";
  final String category;
  const CategoryDealsScreens({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreens> createState() => _CategoryDealsScreensState();
}

class _CategoryDealsScreensState extends State<CategoryDealsScreens> {
  HomeServices homeServices = HomeServices();
  List<Product>? productList;

  @override
  void initState() {
    super.initState();
    fetchCategoryProduct();
  }

  void fetchCategoryProduct() async {
    productList = await homeServices.fetchCategoryProducts(
        context: context, category: widget.category);
        setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
      body:
       productList==null? const Center(
        child: CircularProgressIndicator() ,
      )
      : 
      Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.topLeft,
            child: Text(
              "keep shopping for ${widget.category}",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 170,
            child: GridView.builder(
                itemCount: productList!.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.4,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final product = productList![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 130,
                        child: DecoratedBox(decoration: BoxDecoration(border: Border.all(color:Colors.black12,width: 0.5)),
                        
                        child: Padding(padding: EdgeInsets.all(10),
                        child: Image.network(product.images[0])
                        ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
