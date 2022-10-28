import 'dart:convert';
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
