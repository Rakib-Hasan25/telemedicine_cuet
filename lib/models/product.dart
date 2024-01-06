import 'dart:convert';

import 'package:flutter_amazon_clone/models/rating.dart';

class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;
  final List<Rating>? rating;
  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      'rating': rating
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        quantity: map['quantity']?.toDouble() ?? 0.0,
        images: List<String>.from(map['images']),
        category: map['category'] ?? '',
        price: map['price']?.toDouble() ?? 0.0,
        id: map['_id'],
        rating: map['rating'] != null
            ? List<Rating>.from(
                map['rating']?.map(
                  (x) => Rating.fromMap(x),
                ),
              )
            : null);
  }
  /*
    map['rating'] er modde 
    [
      {userId:1, rating: 3}, 
      {userId:2, rating: 4}

      ] ei data ta ase but eta List form e ase  

      ==>  Product class er modde rating er modde List<Rating> takbe
      ==>  map['rating'] ke convert korte hobe List<Rating> e , Rating holo , Rating Class er object
      ==>List<Rating>.from() ei function ta Rating object er List create kore dibe
      ==>map['rating']?.map((x) => Rating.fromMap(x) , ei dap e map['rating'] er modde takha
      array tar every element ke neya hocce , and     Rating.fromMap(x)er function e pass korche 

      ==>Rating .fromMap() er function ta ekta Map<String, dynamic> recieve kore and ekta Rating object return kor
    */

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
