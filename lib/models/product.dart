class Product {
  late String name;
  late String shortDescription;
  late String description;
  late String brand;
  late String imageUrl;
  late double price;
  late int stock;

  Product(data) {
    name = data['name'];
    shortDescription = data['short_description'];
    description = data['description'];
    brand = data['brand'];
    imageUrl = data['image_url'];
    price = data['price'];
    stock = data['stock'];
  }
}
