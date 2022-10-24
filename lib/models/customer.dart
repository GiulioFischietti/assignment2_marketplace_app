import 'package:marketplace_exercise/models/user.dart';

class Customer extends User {
  late int id;
  late int userId;
  late String country;
  late String address;
  late String phone;

  Customer(data) : super(data) {
    id = data['id'];
    print("CUSTOMER.ID $id");
    userId = data['user_id'];
    print("CUSTOMER.user_id $userId");
    country = data['country'];
    address = data['address'];
    phone = data['phone'];
  }
}
