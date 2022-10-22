class ProductOrder {
  late String id;
  late double total;
  late double quantity;
  late int productId;

  ProductOrder.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      total = jsonMap['total'] != null ? jsonMap['total'].toDouble() : 0.0;
      quantity =
          jsonMap['quantity'] != null ? jsonMap['quantity'].toDouble() : 0.0;
    } catch (e) {
      id = '';
      total = 0.0;
      quantity = 0.0;
    }
  }
}
