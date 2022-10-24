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
    id = data['id'];
    print("BOOK.ID $id");
    productId = data['product_id'];
    print("BOOK.product_id $productId");
    summary = data['summary'];
    nPages = data['n_pages'];
    language = data['language'];
  }
}
