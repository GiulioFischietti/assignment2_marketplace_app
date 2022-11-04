import 'dart:convert';

import 'package:http/http.dart' as http;

class Repo {
  String host = "http://192.168.132.110:3000/";

  Future<dynamic> getData(String query) async {
    final response = await http.get(
      Uri.parse(host + query),
      headers: {"Content-Type": "application/json"},
    );

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

  Future<dynamic> postData(String path, dynamic body) async {
    final response = await http.post(Uri.parse(host + path),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));

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
}
