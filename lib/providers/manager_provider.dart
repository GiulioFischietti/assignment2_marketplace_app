import 'dart:convert';
import 'package:marketplace_exercise/models/products_by_category.dart';
import 'package:marketplace_exercise/models/user.dart';
import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/repositories/home_repo.dart';
import 'package:marketplace_exercise/repositories/manager_repo.dart';
import 'package:marketplace_exercise/repositories/user_repo.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ManagerProvider extends ChangeNotifier {
  bool loading = false;
  List<ProductsByCategory> productsByCategory = [];

  void getProductsByCategory() async {
    List<ProductsByCategory> _productsByCategory = [];
    var json = await getProductsByCategoryData();

    for (var book in json['data']) {
      _productsByCategory.add(ProductsByCategory(book));
    }

    productsByCategory = _productsByCategory;
    notifyListeners();
  }
}
