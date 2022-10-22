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
}
