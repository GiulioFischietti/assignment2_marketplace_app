import 'dart:convert';

import 'package:marketplace_exercise/models/beer.dart';
import 'package:marketplace_exercise/models/book.dart';
import 'package:marketplace_exercise/models/books_by_brand.dart';
import 'package:marketplace_exercise/models/monitor.dart';
import 'package:marketplace_exercise/models/monitors_by_brand.dart';
import 'package:marketplace_exercise/models/product.dart';
import 'package:marketplace_exercise/models/user.dart';
import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/repositories/home_repo.dart';
import 'package:marketplace_exercise/repositories/user_repo.dart';

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

  List<MonitorsByBrand> monitorsByBrand = [];
  List<BooksByBrand> booksByBrand = [];

  void getBeers() async {
    List<Beer> _beers = [];
    var beersJson = await getBeersData();
    print(beersJson);
    for (var beer in beersJson['data']) {
      _beers.add(Beer(beer));
    }

    beers = _beers;
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

  void getBooks() async {
    List<Book> _books = [];
    var beersJson = await getBooksData();
    for (var book in beersJson['data']) {
      _books.add(Book(book));
    }

    books = _books;
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

  void getBooksByBrand() async {
    List<BooksByBrand> _booksByBrand = [];
    var json = await getBooksByBrandData();

    for (var book in json['data']) {
      // print(book);
      _booksByBrand.add(BooksByBrand(book));
    }

    booksByBrand = _booksByBrand;
    notifyListeners();
  }

  void getMonitorsByBrand() async {
    List<MonitorsByBrand> _monitorsByBrand = [];
    var json = await getMonitorsByBrandData();

    for (var book in json['data']) {
      // print(book);
      _monitorsByBrand.add(MonitorsByBrand(book));
    }

    monitorsByBrand = _monitorsByBrand;
    notifyListeners();
  }

  void getMonitors() async {
    List<Monitor> _monitors = [];
    var beersJson = await getMonitorsData();

    for (var monitor in beersJson['data']) {
      _monitors.add(Monitor(monitor));
    }

    monitors = _monitors;
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

  void searchProducts(String keyword) async {
    List<Product> _products = [];
    var beersJson = await searchProdutsData(keyword);

    for (var item in beersJson['data']) {
      _products.add(Product(item));
    }

    productsResult = _products;
    notifyListeners();
  }
}
