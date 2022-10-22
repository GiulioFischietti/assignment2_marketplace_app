class Product {
  late int id;
  late String name;
  late String shortDescription;
  late String description;
  late String brand;
  late String category;
  late String imageUrl;
  late bool imageUnavailable;
  late double price;
  late int stock;

  Product(data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    shortDescription = data['short_description'];
    description = data['description'];
    brand = data['brand'];
    imageUnavailable = (data['image_url'] == "");
    imageUrl = data['image_url'] == ""
        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSSJXPMV4om8DHHMSpua5R6d8TlCmR0zDwbQ&usqp=CAU"
        : data['image_url'];
    price = double.parse(data['price'].toString());
    stock = data['stock'];
  }
}
