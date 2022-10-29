import 'dart:convert';
import 'package:marketplace_exercise/models/beer.dart';
import 'package:marketplace_exercise/models/book.dart';
import 'package:marketplace_exercise/models/manager.dart';
import 'package:marketplace_exercise/models/monitor.dart';
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
  late Book book;
  late Monitor monitor;
  late Beer beer;
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

  void getBeerById(int id) async {
    loading = true;
    notifyListeners();
    var beerJson = await getBeerByIdData(id);
    print(beerJson);
    beer = Beer(beerJson['data']);
    loading = false;
    notifyListeners();
  }

  void getMonitorById(int id) async {
    loading = true;
    notifyListeners();
    var beersJson = await getMonitorByIdData(id);
    monitor = Monitor(beersJson['data']);
    loading = false;
    notifyListeners();
  }

  void getBookById(int id) async {
    loading = true;
    notifyListeners();
    var beersJson = await getBookByIdData(id);
    book = Book(beersJson['data']);
    loading = false;
    notifyListeners();
  }

  Future<bool> logInAsManager(String username, String password) async {
    var data = await logInAsManagerData(username, password);
    manager = Manager(data['data']);
    notifyListeners();
    return data['success'];
  }

  void updateMonitor(Monitor updatedMonitor) async {
    loading = true;
    notifyListeners();
    var beersJson = await updateMonitorData(updatedMonitor);
    getMonitorById(updatedMonitor.productId);
    getProductsByCategory();
    loading = false;
    notifyListeners();
  }

  void updateBeer(Beer updatedBeer) async {
    loading = true;
    notifyListeners();
    var beersJson = await updateBeerData(updatedBeer);
    getBeerById(updatedBeer.productId);
    getProductsByCategory();
    loading = false;
    notifyListeners();
  }

  void createBeer(Beer updatedBeer) async {
    loading = true;
    notifyListeners();
    var beersJson = await createBeerData(updatedBeer);

    getProductsByCategory();
    loading = false;
    notifyListeners();
  }

  void createBook(Book updatedBook) async {
    loading = true;
    notifyListeners();
    var beersJson = await createBookData(updatedBook);

    getProductsByCategory();
    loading = false;
    notifyListeners();
  }

  void createMonitor(Monitor updatedMonitor) async {
    loading = true;
    notifyListeners();
    var beersJson = await createMonitorData(updatedMonitor);

    getProductsByCategory();
    loading = false;
    notifyListeners();
  }

  void updateBook(Book updatedBook) async {
    loading = true;
    notifyListeners();
    var beersJson = await updateBookData(updatedBook);
    getBookById(updatedBook.productId);
    getProductsByCategory();
    loading = false;
    notifyListeners();
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

  void updateStatusOrder(String status, int id) async {
    orders.where((element) => element.id == id).first.status = status;
    notifyListeners();
    var json = await updateStatusOrderData(status, id);
  }
}
