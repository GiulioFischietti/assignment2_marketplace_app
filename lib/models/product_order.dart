import 'package:marketplace_exercise/models/product.dart';

class ProductOrder extends Product {
  int id = 0;
  late double total;
  late double quantity;
  late int orderId;
  late int productId;

  ProductOrder(jsonMap) : super(jsonMap) {
    id = jsonMap['id'] ?? 0;
    productId = jsonMap['product_id'];
    total = jsonMap['total'] != null ? jsonMap['total'].toDouble() : 0.0;
    quantity =
        jsonMap['quantity'] != null ? jsonMap['quantity'].toDouble() : 0.0;
  }
}
