// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/common/widgets/stars.dart';
import 'package:flutter_amazon_clone/features/product_details/screens/product_details_screens.dart';

import 'package:flutter_amazon_clone/models/product.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    double  avgRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    if (totalRating != 0) avgRating = totalRating /product.rating!.length;
    
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetailsScreen.routeName,
          arguments: product),
      child: Column(
        children: [
          Container(
            height: 130,
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            // decoration: BoxDecoration(
            //   border: Border.all(width: 1.0,
            //   color: Colors.teal
            //   ),
            //   borderRadius: const BorderRadius.all(
            //       Radius.circular(5.0) //
            //       ),
            // ),
            child: Row(
              children: [
                Image.network(
                  product.images[0],
                  fit: BoxFit.contain,
                  height: 135,
                  width: 135,
                ),
                Column(
                  children: [
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        product.name,
                        style: const TextStyle(fontSize: 16),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                        width: 235,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Stars(rating: avgRating)),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        '\$${product.price}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: const Text(
                        'Eligible for free shipping',
                        style: TextStyle(fontSize: 12),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: const Text(
                        'In Stock',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                        maxLines: 2,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
