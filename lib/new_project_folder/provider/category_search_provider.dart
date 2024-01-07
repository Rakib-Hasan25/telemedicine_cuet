


import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/new_project_folder/utils/constants.dart';

class CategorySearchProvider with ChangeNotifier {
  List<Map<String , String >> _allDoctorsCategory = Constant.doctorCategories;
  List<Map<String , String >> _foundItems = [];

  List<Map<String , String >> get foundItems => _foundItems;

  void searchItems(String query) {
    if (query.isEmpty) {
      _foundItems =  _allDoctorsCategory;
    } else {
      _foundItems =  _allDoctorsCategory
          .where((item) => item['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  CategorySearchProvider() {
    searchItems('');
  }
}