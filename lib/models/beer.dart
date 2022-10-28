import 'dart:convert';

import 'package:marketplace_exercise/models/product.dart';

class Beer extends Product {
  late int id;
  late int productId;
  late double alcoholPercentage;
  late int volumeMl;

  Beer(data) : super(data) {
    id = data['id'];
    productId = data['product_id'];
    alcoholPercentage = double.parse(data['alcohol_percentage'].toString());
    volumeMl = data['volume_ml'];
  }
  @override
  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'short_description': shortDescription});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'brand': brand});
    result.addAll({'stock': stock});

    result.addAll({'product_id': productId});
    result.addAll({'alcohol_percentage': alcoholPercentage});
    result.addAll({'volume_ml': volumeMl});

    return result;
  }
}
