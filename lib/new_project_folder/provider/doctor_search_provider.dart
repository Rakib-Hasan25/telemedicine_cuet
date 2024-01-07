import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/new_project_folder/utils/constants.dart';

class DoctorSearchProvider with ChangeNotifier {
  List<Map<String , String >> _allDoctors = Constant.doctors;
  List<Map<String , String >> _foundItems = [];

  List<Map<String , String >> get foundItems => _foundItems;

  void searchItems(String query) {
    if (query.isEmpty) {
      _foundItems =  _allDoctors;
    } else {
      _foundItems =  _allDoctors
          .where((item) => item['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  DoctorSearchProvider() {
    searchItems('');
  }
}