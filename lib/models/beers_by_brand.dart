import 'package:marketplace_exercise/models/beer.dart';
import 'package:marketplace_exercise/models/book.dart';
import 'package:marketplace_exercise/models/product.dart';

class BeersByBrand {
  late List<Beer> beer = [];
  late String brand;

  BeersByBrand(data) {
    brand = data['brand'];

    for (var item in data['beer']) {
      // print(item);
      beer.add(Beer(item));
    }
  }
}
