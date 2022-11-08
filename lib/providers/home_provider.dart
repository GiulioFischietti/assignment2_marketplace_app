import 'dart:convert';

import 'package:marketplace_exercise/models/beer.dart';
import 'package:marketplace_exercise/models/beers_by_brand.dart';
import 'package:marketplace_exercise/models/book.dart';
import 'package:marketplace_exercise/models/books_by_brand.dart';
import 'package:marketplace_exercise/models/monitor.dart';
import 'package:marketplace_exercise/models/monitors_by_brand.dart';
import 'package:marketplace_exercise/models/product.dart';
import 'package:marketplace_exercise/models/user.dart';
import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/repositories/product_repo.dart';
import 'package:marketplace_exercise/repositories/cart_repo.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  bool loading = false;
  List<Beer> beers = [];
  late Beer beer;
  late Book book;
  late Monitor monitor;

  List<Book> books = [];
  List<Monitor> monitors = [];
  List<Product> productsResult = [];

  List<BeersByBrand> beersByBrand = [];
  List<MonitorsByBrand> monitorsByBrand = [];
  List<BooksByBrand> booksByBrand = [];

  void getBeers() async {
    var json = await getBeersData();
    beers = (json['data'] as List).map((e) => Beer(e)).toList();
    notifyListeners();
  }

  void getBeerById(int id) async {
    loading = true;
    notifyListeners();
    var beerJson = await getBeerByIdData(id);
    beer = Beer(beerJson['data']);
    loading = false;
    notifyListeners();
  }

  void getBooks() async {
    var json = await getBooksData();
    books = (json['data'] as List).map((e) => Book(e)).toList();
    notifyListeners();
  }

  void getBookById(int id) async {
    loading = true;
    notifyListeners();
    var json = await getBookByIdData(id);
    book = Book(json['data']);
    loading = false;
    notifyListeners();
  }

  void getMonitors() async {
    var json = await getMonitorsData();
    monitors = (json['data'] as List).map((e) => Monitor(e)).toList();
    notifyListeners();
  }

  void getMonitorById(int id) async {
    loading = true;
    notifyListeners();
    var json = await getMonitorByIdData(id);
    monitor = Monitor(json['data']);
    loading = false;
    notifyListeners();
  }

  void getBooksByBrand() async {
    var json = await getBooksByBrandData();
    booksByBrand = (json['data'] as List).map((e) => BooksByBrand(e)).toList();
    notifyListeners();
  }

  void getBeersByBrand() async {
    var json = await getBeersByBrandData();
    beersByBrand = (json['data'] as List).map((e) => BeersByBrand(e)).toList();
    notifyListeners();
  }

  void getMonitorsByBrand() async {
    var json = await getMonitorsByBrandData();
    monitorsByBrand =
        (json['data'] as List).map((e) => MonitorsByBrand(e)).toList();
    notifyListeners();
  }

  void searchProducts(String keyword) async {
    var json = await searchProdutsData(keyword);
    productsResult = (json['data'] as List).map((e) => Product(e)).toList();
    notifyListeners();
  }
}
