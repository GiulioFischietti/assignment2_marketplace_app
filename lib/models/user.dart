class User {
  late int id;
  late String name;
  late String imageUrl;
  late String username;
  late int orderCount;
  late double totalSpent;
  // late DateTime createdAt;
  // late DateTime updatedAt;

  User(data) {
    id = data['id'] ?? 0;
    name = data['name'] ?? "";
    orderCount = data['order_count'] ?? 0;
    totalSpent = double.parse((data['order_total'] ?? 0).toString());
    username = data['username'] ?? "";
    imageUrl = data['image_url'] ??
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png";
    // createdAt = DateTime.parse(data['created_at']);
    // updatedAt = DateTime.parse(data['updated_at']);
  }
}
