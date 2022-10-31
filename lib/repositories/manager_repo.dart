import 'dart:convert';
import 'package:marketplace_exercise/models/beer.dart';
import 'package:marketplace_exercise/models/book.dart';
import 'package:marketplace_exercise/models/monitor.dart';
import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/screens/user/BottomTabContainer.dart';
import 'package:marketplace_exercise/screens/user/Home.dart';
import 'package:http/http.dart' as http;
import 'package:marketplace_exercise/widgets/user/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> getProductsByCategoryData() async {
  final response = await http.get(
    Uri.parse("http://192.168.1.109:3000" + '/productsbycategory'),
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);

    return responseData;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load');
  }
}

Future<dynamic> getManagerOrdersData() async {
  final response = await http.get(
    Uri.parse("http://192.168.1.109:3000" + '/managerorders'),
    headers: {"Content-Type": "application/json"},
  );

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);

    return responseData;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load');
  }
}

Future<dynamic> updateMonitorData(Monitor monitor) async {
  final response = await http.post(
      Uri.parse("http://192.168.1.109:3000" + '/updatemonitor'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(monitor.toJson()));

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);

    return responseData;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load');
  }
}

Future<dynamic> updateBookData(Book book) async {
  final response = await http.post(
      Uri.parse("http://192.168.1.109:3000" + '/updatebook'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(book.toJson()));

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);

    return responseData;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load');
  }
}

Future<dynamic> updateStatusOrderData(String status, int id) async {
  final response = await http.post(
      Uri.parse("http://192.168.1.109:3000" + '/updatestatusorder'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"id": id, "status": status}));

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    return responseData;
  } else {
    throw Exception('Failed to load');
  }
}

Future<dynamic> updateBeerData(Beer beer) async {
  final response = await http.post(
      Uri.parse("http://192.168.1.109:3000" + '/updatebeer'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(beer.toJson()));

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);

    return responseData;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load');
  }
}

createBeerData(Beer beer) async {
  final response = await http.post(
      Uri.parse("http://192.168.1.109:3000" + '/createbeer'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(beer.toJson()));

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);

    return responseData;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load');
  }
}

createBookData(Book book) async {
  final response = await http.post(
      Uri.parse("http://192.168.1.109:3000" + '/createbook'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(book.toJson()));

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);

    return responseData;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load');
  }
}

createMonitorData(Monitor monitor) async {
  final response = await http.post(
      Uri.parse("http://192.168.1.109:3000" + '/createmonitor'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(monitor.toJson()));

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);

    return responseData;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load');
  }
}

Future<dynamic> getProductAnalyticsData(
    DateTime startDate, DateTime endDate, String sorting) async {
  print(startDate.toLocal().toString().split(' ')[0]);
  final response = await http.get(
      Uri.parse("http://192.168.1.109:3000" +
          '/productanalytics?start_date=${startDate.toLocal().toString().split(' ')[0]}&end_date=${endDate.toLocal().toString().split(' ')[0]}&sorting=$sorting'),
      headers: {"Content-Type": "application/json"});

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    print(responseData);

    return responseData;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load');
  }
}

Future<dynamic> getCustomerAnalyticsData(
    DateTime startDate, DateTime endDate, String sorting) async {
  final response = await http.get(
      Uri.parse("http://192.168.1.109:3000" +
          '/customeranalytics?start_date=${startDate.toLocal().toString().split(' ')[0]}&end_date=${endDate.toLocal().toString().split(' ')[0]}&sorting=$sorting'),
      headers: {"Content-Type": "application/json"});

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);

    return responseData;
  } else {
    throw Exception('Failed to load');
  }
}

Future<dynamic> getExpencesAnalyticsData(
    DateTime startDate, DateTime endDate, String sorting) async {
  final response = await http.get(
      Uri.parse("http://192.168.1.109:3000" +
          '/expencesanalytics?start_date=${startDate.toLocal().toString().split(' ')[0]}&end_date=${endDate.toLocal().toString().split(' ')[0]}&sorting=$sorting'),
      headers: {"Content-Type": "application/json"});

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);

    return responseData;
  } else {
    throw Exception('Failed to load');
  }
}
