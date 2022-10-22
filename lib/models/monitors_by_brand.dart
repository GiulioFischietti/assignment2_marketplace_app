import 'package:marketplace_exercise/models/book.dart';
import 'package:marketplace_exercise/models/monitor.dart';
import 'package:marketplace_exercise/models/product.dart';

class MonitorsByBrand {
  late List<Monitor> monitors = [];
  late String brand;

  MonitorsByBrand(data) {
    brand = data['brand'];

    for (var item in data['monitors']) {
      print(item);
      monitors.add(Monitor(item));
    }
  }
}
