import 'package:marketplace_exercise/models/book.dart';
import 'package:marketplace_exercise/models/product.dart';

class BooksByBrand {
  late List<Book> books = [];
  late String brand;

  BooksByBrand(data) {
    brand = data['brand'];

    for (var item in data['books']) {
      print(item);
      books.add(Book(item));
    }
  }
}
