class User {
  late int id;
  late String name;
  late String imageUrl;
  late String username;
  // late DateTime createdAt;
  // late DateTime updatedAt;

  User(data) {
    id = data['id'];
    name = data['name'];
    username = data['username'];
    imageUrl = data['image_url'] ?? "";
    // createdAt = DateTime.parse(data['created_at']);
    // updatedAt = DateTime.parse(data['updated_at']);
  }
}
