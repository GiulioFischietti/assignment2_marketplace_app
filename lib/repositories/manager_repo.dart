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

Future<dynamic> getProductsByCategoryData() async {
  return await Repo().getData("productsbycategory");
}

Future<dynamic> getManagerOrdersData() async {
  return await Repo().getData("managerorders");
}

Future<dynamic> updateMonitorData(Monitor monitor) async {
  return await Repo().postData("updatemonitor", monitor.toJson());
}

Future<dynamic> updateBookData(Book book) async {
  return await Repo().postData("updatebook", book.toJson());
}

Future<dynamic> updateBeerData(Beer beer) async {
  return await Repo().postData("updatebeer", beer.toJson());
}

Future<dynamic> updateStatusOrderData(String status, int id) async {
  return await Repo()
      .postData("updatestatusorder", {"id": id, "status": status});
}

Future<dynamic> createBeerData(Beer beer) async {
  return await Repo().postData("createbeer", beer.toJson());
}

Future<dynamic> createBookData(Book book) async {
  return await Repo().postData("createbook", book.toJson());
}

Future<dynamic> createMonitorData(Monitor monitor) async {
  return await Repo().postData("createmonitor", monitor.toJson());
}

Future<dynamic> getProductAnalyticsData(
    DateTime startDate, DateTime endDate, String sorting) async {
  return await Repo().getData(
      "productanalytics?start_date=${startDate.toLocal().toString().split(' ')[0]}&end_date=${endDate.toLocal().toString().split(' ')[0]}&sorting=$sorting");
}

Future<dynamic> getCustomerAnalyticsData(
    DateTime startDate, DateTime endDate, String sorting) async {
  return await Repo().getData(
      "customeranalytics?start_date=${startDate.toLocal().toString().split(' ')[0]}&end_date=${endDate.toLocal().toString().split(' ')[0]}&sorting=$sorting");
}

Future<dynamic> getExpencesAnalyticsData(
    DateTime startDate, DateTime endDate, String sorting) async {
  return await Repo().getData(
      "expencesanalytics?start_date=${startDate.toLocal().toString().split(' ')[0]}&end_date=${endDate.toLocal().toString().split(' ')[0]}&sorting=$sorting");
}
