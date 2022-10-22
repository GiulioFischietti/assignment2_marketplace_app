import 'package:marketplace_exercise/models/product.dart';

class Book extends Product {
  late int id;
  late int productId;
  late int nPages;
  late String summary;
  late String language;

  Book(data) : super(data) {
    id = data['id'];
    productId = data['product_id'];
    summary = data['summary'];
    nPages = data['n_pages'];
    language = data['language'];
  }
}
