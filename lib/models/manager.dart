import 'package:marketplace_exercise/models/user.dart';

class Manager extends User {
  late int id;
  late String title;
  late DateTime hiredDate;

  Manager(data) : super(data) {
    id = data['id'];
    title = data['title'];
    hiredDate = data['hired_date'];
  }
}
