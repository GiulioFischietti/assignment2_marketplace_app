import 'dart:convert';
import 'package:marketplace_exercise/models/product_order.dart';
import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/providers/user_provider.dart';
import 'package:marketplace_exercise/screens/user/BottomTabContainer.dart';
import 'package:marketplace_exercise/screens/user/Home.dart';
import 'package:http/http.dart' as http;
import 'package:marketplace_exercise/widgets/user/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      Uri.parse("http://192.168.1.16:3000" + '/login'),
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

Future<dynamic> logInAsManagerData(String username, String password) async {
  final response = await http.post(
      Uri.parse("http://192.168.1.16:3000" + '/loginasmanager'),
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

Future<dynamic> updateUserData(
    int id, String name, String username, String phone, String address) async {
  final response = await http.post(
      Uri.parse("http://192.168.1.16:3000" + '/updateuser'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": id,
        "name": name,
        "username": username,
        "phone": phone,
        "address": address
      }));

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

Future<dynamic> getUserOrdersData(int customer_id) async {
  final response = await http.get(
      Uri.parse("http://192.168.1.16:3000" + '/orders?id=$customer_id'),
      headers: {"Content-Type": "application/json"});

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

Future<dynamic> getUserOrderDetailsData(int order_id, int customer_id) async {
  final response = await http.get(
      Uri.parse("http://192.168.1.16:3000" +
          '/orderdetails?id=$customer_id&order_id=$order_id'),
      headers: {"Content-Type": "application/json"});

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

Future<dynamic> getUserCartData(int customer_id) async {
  final response = await http.get(
      Uri.parse("http://192.168.1.16:3000" + '/getcart?id=$customer_id'),
      headers: {"Content-Type": "application/json"});

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

Future<dynamic> removeOneFromCart(int cart_item_id, int user_id) async {
  final response = await http.post(
      Uri.parse("http://192.168.1.16:3000" + '/removefromcart'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"id": cart_item_id, "user_id": user_id}));

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

Future<dynamic> removeAllFromCart(int cart_item_id, int user_id) async {
  final response = await http.post(
      Uri.parse("http://192.168.1.16:3000" + '/removeallitemfromcart'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"id": cart_item_id, "user_id": user_id}));

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

Future<dynamic> addToCart(
    {int? product_id,
    String? name,
    String? category,
    double? price,
    int? user_id,
    String? image_url}) async {
  final response =
      await http.post(Uri.parse("http://192.168.1.16:3000" + '/addtocart'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "product_id": product_id,
            "name": name,
            "category": category,
            "price": price,
            "user_id": user_id,
            "image_url": image_url
          }));

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

Future<dynamic> createOrderData(
    {List<ProductOrder>? product_orders,
    int? customer_id,
    double? total,
    String? shipping_address,
    String? shipping_country,
    String? payment_type}) async {
  final response =
      await http.post(Uri.parse("http://192.168.1.16:3000" + '/createorder'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": customer_id,
            "total": (product_orders!.map((e) => e.price * e.quantity))
                .reduce((a, b) => a + b),
            "shipping_address": shipping_address,
            "shipping_country": shipping_country,
            "payment_type": payment_type,
            "product_orders": product_orders.map((e) {
              print(e.toJson());
              return e.toJson();
            }).toList()
          }));

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
