import 'dart:convert';

import 'package:marketplace_exercise/models/user.dart';
import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/repositories/user_repo.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  bool loading = false;
  late User user;

  Future<dynamic> recoverPassword(String username) async {
    var data = await http.post(Uri.parse(host + '/recoverypassword'),
        body: {"username": username});
    return data;
  }

  Future<bool> logIn(String username, String password) async {
    var data = await logInData(username, password);
    user = User(data['data']);
    notifyListeners();
    return data['success'];
  }
}
