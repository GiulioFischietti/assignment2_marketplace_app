import 'dart:convert';
import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/screens/BottomTabContainer.dart';
import 'package:marketplace_exercise/screens/Home.dart';
import 'package:http/http.dart' as http;
import 'package:marketplace_exercise/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future deleteProfile(String password) async {
  final prefs = await SharedPreferences.getInstance();

  Map<String, String> body = {};

  if (prefs.getString('api_token') != null &&
      prefs.getString('email') != null) {
    body.addAll({
      "api_token": prefs.getString('api_token')!,
      "email": prefs.getString("email")!,
      "password": password
    });
  }

  final response = await http.post(Uri.parse(host + '/auth/deleteaccount'),
      headers: {"Content-Type": "application/json"}, body: body);
  var responseJson = json.decode(response.body);
  return !responseJson['error'];
}

Future<dynamic> logInData(String username, String password) async {
  final response = await http.post(
      Uri.parse("http://192.168.1.109:3000" + '/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}));

  if (response.statusCode == 200) {
    var loginResponse = json.decode(response.body);
    // print(loginResponse);
    return loginResponse;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load');
  }
}
