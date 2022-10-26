import 'dart:convert';

import 'package:marketplace_exercise/models/customer.dart';
import 'package:marketplace_exercise/models/order.dart';
import 'package:marketplace_exercise/models/product_order.dart';
import 'package:marketplace_exercise/models/user.dart';
import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/repositories/user_repo.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  bool loading = false;
  late Customer user;
  List<Order> orders = [];
  List<ProductOrder> productOrders = [];
  List<ProductOrder> cartProducts = [];

  Future<dynamic> recoverPassword(String username) async {
    var data = await http.post(Uri.parse(host + '/recoverypassword'),
        body: {"username": username});
    return data;
  }

  Future<bool> logIn(String username, String password) async {
    var data = await logInData(username, password);
    user = Customer(data['data']);
    notifyListeners();
    return data['success'];
  }

  Future<void> updateUser(
      String name, String username, String phone, String address) async {
    try {
      loading = true;
      notifyListeners();
      var data =
          await updateUserData(user.userId, name, username, phone, address);
      user = Customer(data['data']);
      loading = false;
      notifyListeners();
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> getUserOrders() async {
    List<Order> _orders = [];
    loading = true;
    notifyListeners();
    var beersJson = await getUserOrdersData(user.id);

    for (var order in beersJson['data']) {
      _orders.add(Order(order));
    }
    loading = false;
    orders = _orders;
    notifyListeners();
  }

  Future<void> getUserCart() async {
    List<ProductOrder> _cartProducts = [];
    loading = true;
    notifyListeners();
    var beersJson = await getUserCartData(user.id);

    for (var order in beersJson['data']) {
      _cartProducts.add(ProductOrder(order));
    }
    loading = false;
    cartProducts = _cartProducts;
    notifyListeners();
  }

  Future<void> getUserOrderDetails(int order_id) async {
    List<ProductOrder> _productOrders = [];

    var beersJson = await getUserOrderDetailsData(order_id, user.id);

    for (var productOrder in beersJson['data']) {
      _productOrders.add(ProductOrder(productOrder));
    }
    productOrders = _productOrders;
    notifyListeners();
  }

  Future<void> addOneToCart(int id) async {
    cartProducts.where((element) => element.id == id).first.quantity++;
    notifyListeners();
  }

  Future<void> removeOneFromCart(int id) async {
    cartProducts.where((element) => element.id == id).first.quantity--;
    notifyListeners();
  }
}
