import 'package:marketplace_exercise/models/beer.dart';
import 'package:marketplace_exercise/models/book.dart';
import 'package:marketplace_exercise/models/product.dart';

class ProductsByCategory {
  late List<Product> products = [];
  late String category;

  ProductsByCategory(data) {
    category = data['category'];

    for (var item in data['products']) {
      // print(item);
      products.add(Product(item));
    }
  }
}
