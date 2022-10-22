import 'package:marketplace_exercise/models/product.dart';

class Monitor extends Product {
  late int id;
  late int productId;
  late int refreshRate;
  late String specialFeatures;
  late double screenSize;
  late String resolution;

  Monitor(data) : super(data) {
    id = data['id'];
    productId = data['product_id'];
    refreshRate = data['refresh_rate'];
    specialFeatures = data['special_features'];
    screenSize = double.parse(data['screen_size'].toString());
    resolution = data['resolution'];
  }
}
