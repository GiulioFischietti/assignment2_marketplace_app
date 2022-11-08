import 'dart:convert';
import 'package:marketplace_exercise/models/beer.dart';
import 'package:marketplace_exercise/models/book.dart';
import 'package:marketplace_exercise/models/monitor.dart';
import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/repositories/repo.dart';
import 'package:marketplace_exercise/screens/user/BottomTabContainer.dart';
import 'package:marketplace_exercise/screens/user/Home.dart';
import 'package:http/http.dart' as http;
import 'package:marketplace_exercise/widgets/user/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> getBeersData() async {
  return await Repo().getData("product/beers");
}

Future<dynamic> getBeerByIdData(int id) async {
  return await Repo().getData("product/beerbyid?product_id=$id");
}

Future<dynamic> getBookByIdData(int id) async {
  return await Repo().getData("product/bookbyid?product_id=$id");
}

Future<dynamic> getMonitorByIdData(int id) async {
  return await Repo().getData("product/monitorbyid?product_id=$id");
}

Future<dynamic> getBooksData() async {
  return await Repo().getData("product/books");
}

Future<dynamic> getBeersByBrandData() async {
  return await Repo().getData("product/beersbybrand");
}

Future<dynamic> getBooksByBrandData() async {
  return await Repo().getData("product/booksbybrand");
}

Future<dynamic> getMonitorsData() async {
  return await Repo().getData("product/monitors");
}

Future<dynamic> searchProdutsData(String keyword) async {
  return await Repo().postData("product/searchproducts", {"keyword": keyword});
}

Future<dynamic> getMonitorsByBrandData() async {
  return await Repo().getData("product/monitorsbybrand");
}

// MANAGER
//
//

Future<dynamic> createBeerData(Beer beer) async {
  return await Repo().postData("product/createbeer", beer.toJson());
}

Future<dynamic> createBookData(Book book) async {
  return await Repo().postData("product/createbook", book.toJson());
}

Future<dynamic> createMonitorData(Monitor monitor) async {
  return await Repo().postData("product/createmonitor", monitor.toJson());
}

Future<dynamic> getProductsByCategoryData() async {
  return await Repo().getData("product/productsbycategory");
}

Future<dynamic> updateMonitorData(Monitor monitor) async {
  return await Repo().postData("product/updatemonitor", monitor.toJson());
}

Future<dynamic> updateBookData(Book book) async {
  return await Repo().postData("product/updatebook", book.toJson());
}

Future<dynamic> updateBeerData(Beer beer) async {
  return await Repo().postData("product/updatebeer", beer.toJson());
}
