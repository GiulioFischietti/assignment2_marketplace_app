import 'dart:convert';
import 'package:marketplace_exercise/models/product_order.dart';
import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/providers/user_provider.dart';
import 'package:marketplace_exercise/repositories/repo.dart';
import 'package:marketplace_exercise/screens/user/BottomTabContainer.dart';
import 'package:marketplace_exercise/screens/user/Home.dart';
import 'package:http/http.dart' as http;
import 'package:marketplace_exercise/widgets/user/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> logInData(String username, String password) async {
  return await Repo()
      .postData("login", {"username": username, "password": password});
}

Future<bool> signUp(String username, String pwd, String name, String address,
    String phone) async {
  return await Repo().postData("signup", {
    "username": username.replaceAll(" ", ""),
    "password": pwd,
    "name": name,
    'address': address,
    "phone": phone
  });
}

Future<bool> signUpAsManager(String username, String pwd, String name) async {
  return await Repo().postData("signupasamanager", {
    "username": username.replaceAll(" ", ""),
    "password": pwd,
    "name": name,
  });
}

Future<dynamic> logInAsManagerData(String username, String password) async {
  return await Repo()
      .postData("loginasmanager", {"username": username, "password": password});
}

Future<dynamic> updateUserData(
    int id, String name, String username, String phone, String address) async {
  return await Repo().postData("updateuser", {
    "id": id,
    "name": name,
    "username": username,
    "phone": phone,
    "address": address
  });
}

Future<dynamic> getUserOrdersData(int customer_id) async {
  return await Repo().getData("orders?id=$customer_id");
}

Future<dynamic> getUserOrderDetailsData(int order_id, int customer_id) async {
  return await Repo()
      .getData("orderdetails?id=$customer_id&order_id=$order_id");
}

Future<dynamic> getUserCartData(int customer_id) async {
  return await Repo().getData("getcart?id=$customer_id");
}

Future<dynamic> removeOneFromCart(int cart_item_id, int user_id) async {
  return await Repo()
      .postData("removefromcart", {"id": cart_item_id, "user_id": user_id});
}

Future<dynamic> removeAllFromCart(int cart_item_id, int user_id) async {
  return await Repo().postData(
      "removeallitemfromcart", {"id": cart_item_id, "user_id": user_id});
}

Future<dynamic> addToCart(
    {int? product_id,
    String? name,
    String? category,
    double? price,
    int? user_id,
    String? image_url}) async {
  return await Repo().postData("addtocart", {
    "product_id": product_id,
    "name": name,
    "category": category,
    "price": price,
    "user_id": user_id,
    "image_url": image_url
  });
}

Future<dynamic> createOrderData(
    {List<ProductOrder>? product_orders,
    int? customer_id,
    double? total,
    String? shipping_address,
    String? shipping_country,
    String? payment_type}) async {
  return await Repo().postData("createorder", {
    "id": customer_id,
    "total": (product_orders!.map((e) => e.price * e.quantity))
        .reduce((a, b) => a + b),
    "shipping_address": shipping_address,
    "shipping_country": shipping_country,
    "payment_type": payment_type,
    "product_orders": product_orders.map((e) {
      return e.toJson();
    }).toList()
  });
}
