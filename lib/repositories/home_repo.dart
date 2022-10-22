import 'dart:convert';
import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/screens/BottomTabContainer.dart';
import 'package:marketplace_exercise/screens/Home.dart';
import 'package:http/http.dart' as http;
import 'package:marketplace_exercise/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> getBeersData() async {
  final response = await http.get(
    Uri.parse("http://192.168.1.109:3000" + '/beers'),
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

Future<dynamic> getBooksData() async {
  final response = await http.get(
    Uri.parse("http://192.168.1.109:3000" + '/books'),
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

Future<dynamic> getMonitorsData() async {
  final response = await http.get(
    Uri.parse("http://192.168.1.109:3000" + '/monitors'),
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
