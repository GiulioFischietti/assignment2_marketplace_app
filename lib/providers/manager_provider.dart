import 'dart:convert';
import 'package:marketplace_exercise/models/manager.dart';
import 'package:marketplace_exercise/models/order.dart';
import 'package:marketplace_exercise/models/product_order.dart';
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
  List<ProductOrder> productOrders = [];
  List<Order> orders = [];
  late Manager manager;

  void getProductsByCategory() async {
    List<ProductsByCategory> _productsByCategory = [];
    var json = await getProductsByCategoryData();

    for (var book in json['data']) {
      _productsByCategory.add(ProductsByCategory(book));
    }

    productsByCategory = _productsByCategory;
    notifyListeners();
  }

  Future<void> getOrderDetails(int order_id, int user_id) async {
    List<ProductOrder> _productOrders = [];

    var beersJson = await getUserOrderDetailsData(order_id, user_id);
    print(beersJson);
    for (var productOrder in beersJson['data']) {
      _productOrders.add(ProductOrder(productOrder));
    }
    productOrders = _productOrders;
    notifyListeners();
  }

  Future<bool> logInAsManager(String username, String password) async {
    var data = await logInAsManagerData(username, password);
    manager = Manager(data['data']);
    notifyListeners();
    return data['success'];
  }

  void getManagedOrders() async {
    List<Order> _orders = [];
    var json = await getManagerOrdersData();

    for (var order in json['data']) {
      _orders.add(Order(order));
    }

    orders = _orders;
    notifyListeners();
  }
}
