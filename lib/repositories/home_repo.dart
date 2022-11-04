import 'dart:convert';
import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/repositories/repo.dart';
import 'package:marketplace_exercise/screens/user/BottomTabContainer.dart';
import 'package:marketplace_exercise/screens/user/Home.dart';
import 'package:http/http.dart' as http;
import 'package:marketplace_exercise/widgets/user/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> getBeersData() async {
  return await Repo().getData("beers");
}

Future<dynamic> getBeerByIdData(int id) async {
  return await Repo().getData("beerbyid?product_id=$id");
}

Future<dynamic> getBookByIdData(int id) async {
  return await Repo().getData("bookbyid?product_id=$id");
}

Future<dynamic> getMonitorByIdData(int id) async {
  return await Repo().getData("monitorbyid?product_id=$id");
}

Future<dynamic> getBooksData() async {
  return await Repo().getData("books");
}

Future<dynamic> getBeersByBrandData() async {
  return await Repo().getData("beersbybrand");
}

Future<dynamic> getBooksByBrandData() async {
  return await Repo().getData("booksbybrand");
}

Future<dynamic> getMonitorsData() async {
  return await Repo().getData("monitors");
}

Future<dynamic> searchProdutsData(String keyword) async {
  return await Repo().postData("searchproducts", {"keyword": keyword});
}

Future<dynamic> getMonitorsByBrandData() async {
  return await Repo().getData("monitorsbybrand");
}
